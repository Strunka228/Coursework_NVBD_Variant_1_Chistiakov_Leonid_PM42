USE DeaneryDB;
GO

/* 1) Subjects */
CREATE TABLE Subjects (
    SubjectID INT IDENTITY PRIMARY KEY,
    SubjectName NVARCHAR(300) NOT NULL,
    SubjectCode NVARCHAR(20) NULL,
    CONSTRAINT UQ_Subjects_Name UNIQUE (SubjectName)
);
GO

/* 2) Teachers */
CREATE TABLE Teachers (
    TeacherID INT IDENTITY PRIMARY KEY,
    FirstName NVARCHAR(100) NOT NULL,
    LastName  NVARCHAR(100) NOT NULL,
    FacultyID INT NULL, -- если захочешь привязку к факультету
    CONSTRAINT FK_Teachers_Faculties
        FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID)
);
GO

/* 3) TeacherSubjects (кто что ведёт) */
CREATE TABLE TeacherSubjects (
    TeacherID INT NOT NULL,
    SubjectID INT NOT NULL,
    CONSTRAINT PK_TeacherSubjects PRIMARY KEY (TeacherID, SubjectID),
    CONSTRAINT FK_TS_Teachers FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    CONSTRAINT FK_TS_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);
GO

/* 4) Grades (500 000+ записей будет тут) */
CREATE TABLE Grades (
    GradeID BIGINT IDENTITY PRIMARY KEY,
    StudentID INT NOT NULL,
    SubjectID INT NOT NULL,
    TeacherID INT NOT NULL,

    GradeValue TINYINT NOT NULL CHECK (GradeValue BETWEEN 1 AND 12),
    GradeDate DATE NOT NULL,

    CONSTRAINT FK_Grades_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_Grades_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID),
    CONSTRAINT FK_Grades_Teachers FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);
GO

/* Индексы под отчёты */
CREATE INDEX IX_Grades_StudentDate ON Grades(StudentID, GradeDate);
CREATE INDEX IX_Grades_SubjectTeacherDate ON Grades(SubjectID, TeacherID, GradeDate);
GO
