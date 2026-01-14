CREATE TABLE DormRooms (
    RoomID INT IDENTITY PRIMARY KEY,
    Building NVARCHAR(50) NOT NULL,
    RoomNumber NVARCHAR(10) NOT NULL,
    Capacity TINYINT NOT NULL CHECK (Capacity BETWEEN 2 AND 4),
    CONSTRAINT UQ_DormRooms UNIQUE (Building, RoomNumber)
);
GO

CREATE TABLE DormStays (
    StayID BIGINT IDENTITY PRIMARY KEY,
    StudentID INT NOT NULL,
    RoomID INT NOT NULL,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NULL,
    CONSTRAINT FK_Stays_Students FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_Stays_Rooms    FOREIGN KEY (RoomID) REFERENCES DormRooms(RoomID),
    CONSTRAINT CK_Stays_Dates CHECK (CheckOutDate IS NULL OR CheckOutDate >= CheckInDate)
);
GO

CREATE INDEX IX_DormStays_StudentActive ON DormStays(StudentID, CheckOutDate);
GO
