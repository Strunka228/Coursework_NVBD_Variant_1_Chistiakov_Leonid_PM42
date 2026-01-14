INSERT INTO Groups (SpecialtyID, AdmissionYear, StudyForm, GroupNumber, GroupCode)
SELECT SpecialtyID, 2023, 'Full-time', 1, ''
FROM Specialties
WHERE SpecialtyCode = 'DTAP';
