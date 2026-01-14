USE [DeaneryDWH];
GO

IF OBJECT_ID('dbo.DimDormRooms', 'U') IS NOT NULL DROP TABLE dbo.DimDormRooms;
CREATE TABLE dbo.DimDormRooms (
    DormRoomKey INT IDENTITY(1,1) PRIMARY KEY,
    RoomAlternateKey INT NOT NULL,
    Building NVARCHAR(100) NOT NULL,
    RoomNumber NVARCHAR(20) NOT NULL,
    Capacity TINYINT NOT NULL
);
GO

IF OBJECT_ID('dbo.FactDormStays', 'U') IS NOT NULL DROP TABLE dbo.FactDormStays;
CREATE TABLE dbo.FactDormStays (
    FactDormStayKey BIGINT IDENTITY(1,1) PRIMARY KEY,
    
    StudentKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimStudents(StudentKey),
    DormRoomKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimDormRooms(DormRoomKey),
    
    CheckInDateKey INT NOT NULL FOREIGN KEY REFERENCES dbo.DimDate(DateKey),
    CheckOutDateKey INT NULL FOREIGN KEY REFERENCES dbo.DimDate(DateKey), 
    
    StayDurationDays INT NULL,
    IsActive BIT DEFAULT 0,
    
    LoadDate DATETIME DEFAULT GETDATE()
);
GO