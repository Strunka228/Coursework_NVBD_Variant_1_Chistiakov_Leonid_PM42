CREATE TABLE Specialties (
    SpecialtyID INT IDENTITY PRIMARY KEY,
    FacultyID INT NOT NULL,
    SpecialtyName NVARCHAR(200) NOT NULL,
    SpecialtyCode NVARCHAR(20) NOT NULL,
    CONSTRAINT FK_Specialties_Faculty
        FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID),
    CONSTRAINT UQ_Faculty_Specialty UNIQUE (FacultyID, SpecialtyCode)
);
