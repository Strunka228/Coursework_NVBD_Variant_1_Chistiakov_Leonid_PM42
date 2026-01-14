USE DeaneryDB;
GO

/* 0) Чистим Groups (делай это только если Students ещё не генерировались) */
DELETE FROM dbo.Groups;
DBCC CHECKIDENT ('dbo.Groups', RESEED, 0);
GO

/* 1) Удаляем любой UNIQUE constraint на GroupCode (без QUOTENAME) */
DECLARE @uqName sysname;

SELECT TOP 1 @uqName = kc.name
FROM sys.key_constraints kc
JOIN sys.index_columns ic
    ON ic.object_id = kc.parent_object_id AND ic.index_id = kc.unique_index_id
JOIN sys.columns c
    ON c.object_id = ic.object_id AND c.column_id = ic.column_id
WHERE kc.[type] = 'UQ'
  AND kc.parent_object_id = OBJECT_ID('dbo.Groups')
  AND c.name = 'GroupCode';

IF @uqName IS NOT NULL
BEGIN
    EXEC('ALTER TABLE dbo.Groups DROP CONSTRAINT [' + @uqName + '];');
END
GO

/* 2) Триггер: GroupCode = Faculty-Spec-YY(F/P)-NNN */
CREATE OR ALTER TRIGGER dbo.TR_Groups_GenerateCode
ON dbo.Groups
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE g
    SET GroupCode =
        f.FacultyCode + '-' +
        s.SpecialtyCode + '-' +
        RIGHT(CAST(g.AdmissionYear AS varchar(4)), 2) +
        CASE WHEN g.StudyForm = 'Full-time' THEN 'F' ELSE 'P' END +
        '-' +
        RIGHT('000' + CAST(g.GroupNumber AS varchar(3)), 3)
    FROM dbo.Groups g
    JOIN inserted i ON g.GroupID = i.GroupID
    JOIN dbo.Specialties s ON g.SpecialtyID = s.SpecialtyID
    JOIN dbo.Faculties f ON s.FacultyID = f.FacultyID;
END;
GO

/* 3) Ставим UNIQUE на GroupCode (под новый формат) */
ALTER TABLE dbo.Groups
ADD CONSTRAINT UQ_Groups_GroupCode UNIQUE (GroupCode);
GO

/* 4) Генерация групп с проверкой: "если такой GroupCode уже есть — крутим номер ещё раз" */
DECLARE @StartYear INT = 2020;
DECLARE @EndYear   INT = 2024;

DECLARE @SpecialtyID INT;
DECLARE @FacultyCode NVARCHAR(10);
DECLARE @SpecCode NVARCHAR(20);

DECLARE @Year INT;
DECLARE @StudyForm NVARCHAR(20);
DECLARE @GroupsCount INT;
DECLARE @i INT;

DECLARE @GroupNumber INT;
DECLARE @GroupCode NVARCHAR(50);

DECLARE specialty_cursor CURSOR FAST_FORWARD FOR
SELECT s.SpecialtyID, f.FacultyCode, s.SpecialtyCode
FROM dbo.Specialties s
JOIN dbo.Faculties f ON f.FacultyID = s.FacultyID;

OPEN specialty_cursor;
FETCH NEXT FROM specialty_cursor INTO @SpecialtyID, @FacultyCode, @SpecCode;

WHILE @@FETCH_STATUS = 0
BEGIN
    SET @Year = @StartYear;

    WHILE @Year <= @EndYear
    BEGIN
        DECLARE form_cursor CURSOR FAST_FORWARD FOR
        SELECT StudyForm FROM (VALUES ('Full-time'), ('Part-time')) v(StudyForm);

        OPEN form_cursor;
        FETCH NEXT FROM form_cursor INTO @StudyForm;

        WHILE @@FETCH_STATUS = 0
        BEGIN
            -- 1..3 группы на комбинацию
            SET @GroupsCount = ABS(CHECKSUM(NEWID())) % 3 + 1;
            SET @i = 1;

            WHILE @i <= @GroupsCount
            BEGIN
                -- Крутим номер до тех пор, пока будущий GroupCode не станет уникальным
                WHILE 1 = 1
                BEGIN
                    -- диапазон 1..999 (красиво и почти без коллизий)
                    SET @GroupNumber = ABS(CHECKSUM(NEWID())) % 999 + 1;

                    SET @GroupCode =
                        @FacultyCode + '-' +
                        @SpecCode + '-' +
                        RIGHT(CAST(@Year AS varchar(4)), 2) +
                        CASE WHEN @StudyForm = 'Full-time' THEN 'F' ELSE 'P' END +
                        '-' +
                        RIGHT('000' + CAST(@GroupNumber AS varchar(3)), 3);

                    IF NOT EXISTS (SELECT 1 FROM dbo.Groups WHERE GroupCode = @GroupCode)
                        BREAK; -- нашли уникальный
                END

                INSERT INTO dbo.Groups (SpecialtyID, AdmissionYear, StudyForm, GroupNumber, GroupCode)
                VALUES (@SpecialtyID, @Year, @StudyForm, @GroupNumber, '');

                SET @i += 1;
            END

            FETCH NEXT FROM form_cursor INTO @StudyForm;
        END

        CLOSE form_cursor;
        DEALLOCATE form_cursor;

        SET @Year += 1;
    END

    FETCH NEXT FROM specialty_cursor INTO @SpecialtyID, @FacultyCode, @SpecCode;
END

CLOSE specialty_cursor;
DEALLOCATE specialty_cursor;
GO

/* 5) Проверки */
SELECT COUNT(*) AS GroupsCount FROM dbo.Groups;

SELECT TOP 30 GroupCode, AdmissionYear, StudyForm
FROM dbo.Groups
ORDER BY NEWID();
GO
