USE master;
GO

-- 1. Створення бази даних сховища
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DeaneryDWH')
BEGIN
    CREATE DATABASE [DeaneryDWH];
END
GO

USE [DeaneryDWH];
GO

-- 2. Очищення існуючих таблиць (якщо треба перестворити)
-- Спочатку видаляємо факти (бо вони посилаються на виміри)
IF OBJECT_ID('dbo.FactGrades', 'U') IS NOT NULL DROP TABLE dbo.FactGrades;
IF OBJECT_ID('dbo.FactLibraryLoans', 'U') IS NOT NULL DROP TABLE dbo.FactLibraryLoans;

-- Потім видаляємо виміри
IF OBJECT_ID('dbo.DimStudents', 'U') IS NOT NULL DROP TABLE dbo.DimStudents;
IF OBJECT_ID('dbo.DimSubjects', 'U') IS NOT NULL DROP TABLE dbo.DimSubjects;
IF OBJECT_ID('dbo.DimTeachers', 'U') IS NOT NULL DROP TABLE dbo.DimTeachers;
IF OBJECT_ID('dbo.DimBooks', 'U') IS NOT NULL DROP TABLE dbo.DimBooks;
IF OBJECT_ID('dbo.DimDate', 'U') IS NOT NULL DROP TABLE dbo.DimDate;
GO

-- 3. Створення таблиць вимірів (Dimensions)

-- 3.1. DimDate (Часовий вимір - обов'язковий для будь-якого DWH)
CREATE TABLE dbo.DimDate (
    DateKey INT PRIMARY KEY,              -- Формат YYYYMMDD (напр. 20240101)
    FullDate DATE NOT NULL,
    DayNumberOfWeek TINYINT NOT NULL,
    DayName NVARCHAR(20) NOT NULL,
    MonthNumberOfYear TINYINT NOT NULL,
    MonthName NVARCHAR(20) NOT NULL,
    CalendarQuarter TINYINT NOT NULL,
    CalendarYear SMALLINT NOT NULL,
    IsWeekend BIT NOT NULL                -- 1 = Вихідний, 0 = Робочий
);
GO

-- 3.2. DimSubjects (Предмети)
CREATE TABLE dbo.DimSubjects (
    SubjectKey INT IDENTITY(1,1) PRIMARY KEY,
    SubjectAlternateKey INT NOT NULL,     -- ID з вихідної бази (SubjectID)
    SubjectName NVARCHAR(600) NOT NULL,
    SubjectCode NVARCHAR(40) NULL
);
GO

-- 3.3. DimTeachers (Викладачі + Факультет)
CREATE TABLE dbo.DimTeachers (
    TeacherKey INT IDENTITY(1,1) PRIMARY KEY,
    TeacherAlternateKey INT NOT NULL,     -- ID з вихідної бази (TeacherID)
    FullName NVARCHAR(400) NOT NULL,
    FacultyName NVARCHAR(400) NULL        -- Денормалізація: назва факультету викладача
);
GO

-- 3.4. DimBooks (Книги - для аналізу бібліотеки)
CREATE TABLE dbo.DimBooks (
    BookKey INT IDENTITY(1,1) PRIMARY KEY,
    BookAlternateKey INT NOT NULL,        -- ID з вихідної бази (BookID)
    Title NVARCHAR(500) NOT NULL,
    Author NVARCHAR(400) NULL,
    ISBN NVARCHAR(40) NULL
);
GO

-- 3.5. DimStudents (Студенти + Група + Спеціальність + Факультет)
-- Реалізація SCD Type 2 (збереження історії змін групи/прізвища)
CREATE TABLE dbo.DimStudents (
    StudentKey INT IDENTITY(1,1) PRIMARY KEY,
    StudentAlternateKey INT NOT NULL,     -- ID з вихідної бази (StudentID)
    FullName NVARCHAR(400) NOT NULL,
    Gender CHAR(1) NULL,
    
    -- Денормалізовані поля ієрархії
    GroupCode NVARCHAR(100) NULL,         -- Шифр групи
    SpecialtyName NVARCHAR(400) NULL,     -- Назва спеціальності
    FacultyName NVARCHAR(400) NULL,       -- Назва факультету
    EducationForm NVARCHAR(40) NULL,      -- Форма навчання
    
    -- Поля для відстеження історії (SCD Type 2)
    StartDate DATETIME NOT NULL,          -- Коли запис став актуальним
    EndDate DATETIME NULL,                -- Коли запис втратив актуальність (NULL = актуальний)
    IsCurrent BIT NOT NULL DEFAULT 1      -- 1 = поточний запис, 0 = історичний
);
GO

-- 4. Створення таблиць фактів (Facts)

-- 4.1. FactGrades (Оцінки - основна таблиця фактів)
CREATE TABLE dbo.FactGrades (
    FactGradeKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    
    -- Зовнішні ключі до вимірів
    StudentKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimStudents(StudentKey),
    SubjectKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimSubjects(SubjectKey),
    TeacherKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimTeachers(TeacherKey),
    DateKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimDate(DateKey),
    
    -- Міри (Measures)
    GradeValue TINYINT NOT NULL,          -- Сама оцінка
    IsPassing BIT NOT NULL DEFAULT 0,     -- Чи є оцінка прохідною (обчислюється в ETL)
    
    -- Службові поля аудиту
    LoadDate DATETIME DEFAULT GETDATE()
);
GO

-- 4.2. FactLibraryLoans (Видача книг - друга таблиця фактів)
CREATE TABLE dbo.FactLibraryLoans (
    FactLoanKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    
    -- Зовнішні ключі до вимірів
    StudentKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimStudents(StudentKey),
    BookKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimBooks(BookKey),
    
    LoanDateKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimDate(DateKey),   -- Дата видачі
    DueDateKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimDate(DateKey),    -- Дата повернення за планом
    ReturnDateKey INT NULL FOREIGN KEY REFERENCES dbo.DimDate(DateKey),     -- Фактична дата повернення (NULL якщо не повернув)
    
    -- Міри (Measures)
    LoanDurationDays INT NULL,            -- Скільки днів тримав книгу
    OverdueDays INT NULL,                 -- На скільки днів прострочив (0 або більше)
    IsOverdue BIT NOT NULL DEFAULT 0,     -- Факт прострочення (1/0)
    
    LoadDate DATETIME DEFAULT GETDATE()
);
GO

-- 5. Заповнення DimDate (Генерація календаря на 2020-2025 роки)
-- Це потрібно зробити один раз SQL-скриптом, щоб SSIS мав куди посилатися
DECLARE @StartDate DATE = '2020-01-01';
DECLARE @EndDate DATE = '2025-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO dbo.DimDate (
        DateKey, 
        FullDate, 
        DayNumberOfWeek, 
        DayName, 
        MonthNumberOfYear, 
        MonthName, 
        CalendarQuarter, 
        CalendarYear, 
        IsWeekend
    )
    VALUES (
        CAST(CONVERT(VARCHAR(8), @StartDate, 112) AS INT), -- 20240101
        @StartDate,
        DATEPART(dw, @StartDate),
        DATENAME(dw, @StartDate),
        MONTH(@StartDate),
        DATENAME(mm, @StartDate),
        DATEPART(qq, @StartDate),
        YEAR(@StartDate),
        CASE WHEN DATEPART(dw, @StartDate) IN (1, 7) THEN 1 ELSE 0 END -- 1=Sun, 7=Sat (залежить від налаштувань сервера, зазвичай Sat/Sun)
    );

    SET @StartDate = DATEADD(dd, 1, @StartDate);
END
GO

PRINT 'База даних DeaneryDWH та структура таблиць успішно створені!';