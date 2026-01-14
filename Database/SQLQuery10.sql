USE DeaneryDB;
GO

/* 0) На всякий случай проверим, есть ли студенты */
SELECT COUNT(*) AS StudentsCount FROM dbo.Students;
GO

/* 1) Удаляем группы (работает, если StudentsCount = 0) */
DELETE FROM dbo.Groups;
DBCC CHECKIDENT ('dbo.Groups', RESEED, 0);
GO

/* 2) ПАРАМЕТРЫ: как сильно уменьшать */
DECLARE @StartYear INT = 2020;
DECLARE @EndYear   INT = 2024;

DECLARE @PartTimePercent INT = 20;  -- <-- меняй тут: 10, 20, 30 (чем меньше, тем меньше групп)

/* 3) Генерация: Full-time всегда (1 группа), Part-time только у части специальностей */
DECLARE @SpecialtyID INT;
DECLARE @FacultyCode NVARCHAR(10);
DECLARE @SpecCode NVARCHAR(20);

DECLARE @Year INT;
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
        /* ===== FULL-TIME: всегда 1 группа ===== */
        WHILE 1 = 1
        BEGIN
            SET @GroupNumber = ABS(CHECKSUM(NEWID())) % 999 + 1;

            SET @GroupCode =
                @FacultyCode + '-' + @SpecCode + '-' +
                RIGHT(CAST(@Year AS varchar(4)), 2) + 'F-' +
                RIGHT('000' + CAST(@GroupNumber AS varchar(3)), 3);

            IF NOT EXISTS (SELECT 1 FROM dbo.Groups WHERE GroupCode = @GroupCode)
                BREAK;
        END

        INSERT INTO dbo.Groups (SpecialtyID, AdmissionYear, StudyForm, GroupNumber, GroupCode)
        VALUES (@SpecialtyID, @Year, 'Full-time', @GroupNumber, '');

        /* ===== PART-TIME: только у @PartTimePercent% специальностей ===== */
        IF (ABS(CHECKSUM(NEWID())) % 100) < @PartTimePercent
        BEGIN
            WHILE 1 = 1
            BEGIN
                SET @GroupNumber = ABS(CHECKSUM(NEWID())) % 999 + 1;

                SET @GroupCode =
                    @FacultyCode + '-' + @SpecCode + '-' +
                    RIGHT(CAST(@Year AS varchar(4)), 2) + 'P-' +
                    RIGHT('000' + CAST(@GroupNumber AS varchar(3)), 3);

                IF NOT EXISTS (SELECT 1 FROM dbo.Groups WHERE GroupCode = @GroupCode)
                    BREAK;
            END

            INSERT INTO dbo.Groups (SpecialtyID, AdmissionYear, StudyForm, GroupNumber, GroupCode)
            VALUES (@SpecialtyID, @Year, 'Part-time', @GroupNumber, '');
        END

        SET @Year += 1;
    END

    FETCH NEXT FROM specialty_cursor INTO @SpecialtyID, @FacultyCode, @SpecCode;
END

CLOSE specialty_cursor;
DEALLOCATE specialty_cursor;
GO

/* 4) Проверки */
SELECT COUNT(*) AS GroupsCount FROM dbo.Groups;

SELECT TOP 25 GroupCode, AdmissionYear, StudyForm
FROM dbo.Groups
ORDER BY NEWID();
GO
