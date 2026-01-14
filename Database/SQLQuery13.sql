CREATE TRIGGER TR_DormStays_CheckEnrollment
ON DormStays
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Students s ON s.StudentID = i.StudentID
        WHERE i.CheckInDate < s.EnrollmentDate
    )
    BEGIN
        RAISERROR (
            'CheckInDate cannot be earlier than student EnrollmentDate.',
            16, 1
        );
        ROLLBACK TRANSACTION;
    END
END;
GO
