CREATE TABLE Students (
    StudentID INT IDENTITY PRIMARY KEY,
    GroupID INT NOT NULL,

    FirstName NVARCHAR(100) NOT NULL,
    LastName NVARCHAR(100) NOT NULL,
    Gender CHAR(1) NOT NULL CHECK (Gender IN ('M', 'F')),

    BirthDate DATE NOT NULL,
    EnrollmentDate DATE NOT NULL,

    CONSTRAINT FK_Students_Groups
        FOREIGN KEY (GroupID) REFERENCES Groups(GroupID)
);
GO
