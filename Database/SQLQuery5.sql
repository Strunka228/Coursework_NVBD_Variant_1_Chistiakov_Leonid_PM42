/* =========================
   Faculty of Law (FL)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Law', 'LAW'
FROM Faculties WHERE FacultyCode = 'FL';


/* =========================
   Faculty of Applied Mathematics and Informatics (FAMI)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Cybersecurity', 'CYB'
FROM Faculties WHERE FacultyCode = 'FAMI';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Informatics', 'INF'
FROM Faculties WHERE FacultyCode = 'FAMI';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Applied Mathematics', 'AM'
FROM Faculties WHERE FacultyCode = 'FAMI';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'System Analysis and Control / Data Analysis', 'SACDA'
FROM Faculties WHERE FacultyCode = 'FAMI';


/* =========================
   Faculty of Electronics and Computer Technology (FECT)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Electronics and Computer Systems', 'ECS'
FROM Faculties WHERE FacultyCode = 'FECT';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Software Engineering', 'SE'
FROM Faculties WHERE FacultyCode = 'FECT';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Information Systems and Technologies', 'IST'
FROM Faculties WHERE FacultyCode = 'FECT';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Computer Science', 'CS'
FROM Faculties WHERE FacultyCode = 'FECT';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Sensor and Diagnostic Electronic Systems', 'SDES'
FROM Faculties WHERE FacultyCode = 'FECT';


/* =========================
   Faculty of Mechanics and Mathematics (FMM)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Econometrics and Operations Research', 'EOR'
FROM Faculties WHERE FacultyCode = 'FMM';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Applied Algebra, Cryptology and Game Theory', 'AACGT'
FROM Faculties WHERE FacultyCode = 'FMM';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Analysis of Mathematical Models', 'AMM'
FROM Faculties WHERE FacultyCode = 'FMM';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Actuarial Mathematics and Risk Management', 'AMRM'
FROM Faculties WHERE FacultyCode = 'FMM';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'IT and Mathematical Modelling in Mechanics', 'ITMMM'
FROM Faculties WHERE FacultyCode = 'FMM';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Statistical Data Analysis', 'SDA'
FROM Faculties WHERE FacultyCode = 'FMM';


/* =========================
   Faculty of Economics (FE)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Economics and Data Analytics', 'EDA'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Economic Cybernetics', 'EC'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'International Economics', 'IE'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Economics and Protection of Business Interests', 'EPBI'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Business Economics', 'BE'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Marketing', 'MKT'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Management', 'MAN'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Business Management and Entrepreneurship', 'BME'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Digital Management in Business', 'DMB'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Accounting/Taxation tracks', 'ACC'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Social Security', 'SS'
FROM Faculties WHERE FacultyCode = 'FE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Logistics and Trade Business', 'LTB'
FROM Faculties WHERE FacultyCode = 'FE';


/* =========================
   Faculty of Finance and Business Management (FFBM)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Digital Economy', 'DE'
FROM Faculties WHERE FacultyCode = 'FFBM';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Public Administration and Business Management', 'PABM'
FROM Faculties WHERE FacultyCode = 'FFBM';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'HR Management in Public Authorities and Business', 'HRM'
FROM Faculties WHERE FacultyCode = 'FFBM';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Finance, Customs and Taxation', 'FCT'
FROM Faculties WHERE FacultyCode = 'FFBM';


/* =========================
   Faculty of International Relations (FIR)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'International Economic Relations', 'IER'
FROM Faculties WHERE FacultyCode = 'FIR';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'International Commerce and Entrepreneurship', 'ICE'
FROM Faculties WHERE FacultyCode = 'FIR';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'International Law', 'IL'
FROM Faculties WHERE FacultyCode = 'FIR';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'International Relations', 'IR'
FROM Faculties WHERE FacultyCode = 'FIR';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'European Studies', 'ES'
FROM Faculties WHERE FacultyCode = 'FIR';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'International Information', 'II'
FROM Faculties WHERE FacultyCode = 'FIR';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'International Security and Crisis Management', 'ISCM'
FROM Faculties WHERE FacultyCode = 'FIR';


/* =========================
   Faculty of Journalism (FJ)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Journalism', 'JRN'
FROM Faculties WHERE FacultyCode = 'FJ';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'International Journalism', 'IJ'
FROM Faculties WHERE FacultyCode = 'FJ';


/* =========================
   Faculty of History (FH)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'History and Archaeology', 'HA'
FROM Faculties WHERE FacultyCode = 'FH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Museum Space Organization / Excursions', 'MSO'
FROM Faculties WHERE FacultyCode = 'FH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Applied Sociology', 'AS'
FROM Faculties WHERE FacultyCode = 'FH';


/* =========================
   Faculty of Philosophy (FPY)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Philosophy', 'PHI'
FROM Faculties WHERE FacultyCode = 'FPY';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Political Science', 'PS'
FROM Faculties WHERE FacultyCode = 'FPY';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Psychology', 'PSY'
FROM Faculties WHERE FacultyCode = 'FPY';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Cultural Studies', 'CSLT'
FROM Faculties WHERE FacultyCode = 'FPY';


/* =========================
   Faculty of Philology (FPH)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Applied Linguistics', 'AL'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Polish Philology', 'PP'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Serbian Philology', 'SP'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Slovak Philology', 'SKP'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Slovene Philology', 'SLP'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Czech Philology', 'CP'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Arabic + Ukrainian Language & Literature', 'AUL'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Chinese Language & Literature', 'CLL'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Ukrainian Language & Literature', 'ULL'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Turkish / Japanese', 'TJ'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Literary Creativity', 'LC'
FROM Faculties WHERE FacultyCode = 'FPH';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Folkloristics', 'FOL'
FROM Faculties WHERE FacultyCode = 'FPH';


/* =========================
   Faculty of Foreign Languages (FFL)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'English + Second Foreign Language & Literature', 'EN2'
FROM Faculties WHERE FacultyCode = 'FFL';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Translation (English + second foreign)', 'TEN'
FROM Faculties WHERE FacultyCode = 'FFL';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'German + English (with translation)', 'DE'
FROM Faculties WHERE FacultyCode = 'FFL';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Translation (German + second foreign, intercultural communication)', 'TD'
FROM Faculties WHERE FacultyCode = 'FFL';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Classical Philology & English', 'CPE'
FROM Faculties WHERE FacultyCode = 'FFL';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Spanish + second foreign', 'SP2'
FROM Faculties WHERE FacultyCode = 'FFL';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'French + English', 'FE'
FROM Faculties WHERE FacultyCode = 'FFL';


/* =========================
   Faculty of Biology (FB)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Biology', 'BIO'
FROM Faculties WHERE FacultyCode = 'FB';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Biotechnology and Bioengineering', 'BTB'
FROM Faculties WHERE FacultyCode = 'FB';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Ecology', 'ECO'
FROM Faculties WHERE FacultyCode = 'FB';


/* =========================
   Faculty of Geography (FG)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Urban Studies', 'US'
FROM Faculties WHERE FacultyCode = 'FG';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Spatial Planning', 'SP'
FROM Faculties WHERE FacultyCode = 'FG';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Regional Development', 'RD'
FROM Faculties WHERE FacultyCode = 'FG';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Geography and Regional Studies', 'GRS'
FROM Faculties WHERE FacultyCode = 'FG';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Hotel and Restaurant Business', 'HRB'
FROM Faculties WHERE FacultyCode = 'FG';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Soil Science and Land Expertise', 'SSLE'
FROM Faculties WHERE FacultyCode = 'FG';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Relief and Geoplanning', 'RG'
FROM Faculties WHERE FacultyCode = 'FG';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Environmental Protection GIS Technologies', 'EPGIS'
FROM Faculties WHERE FacultyCode = 'FG';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Tourism', 'TOUR'
FROM Faculties WHERE FacultyCode = 'FG';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Recreation', 'REC'
FROM Faculties WHERE FacultyCode = 'FG';


/* =========================
   Faculty of Geology (FGL)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Geology / Digital technologies in Earth sciences', 'GDT'
FROM Faculties WHERE FacultyCode = 'FGL';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Engineering Geology and Hydrogeology', 'EGH'
FROM Faculties WHERE FacultyCode = 'FGL';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Subsoil Use', 'SU'
FROM Faculties WHERE FacultyCode = 'FGL';


/* =========================
   Faculty of Physics (FP)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Digital Technologies in Applied Physics', 'DTAP'
FROM Faculties WHERE FacultyCode = 'FP';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Nanophysics and Nanomaterials', 'NN'
FROM Faculties WHERE FacultyCode = 'FP';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Astrophysics and Space Physics', 'ASP'
FROM Faculties WHERE FacultyCode = 'FP';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Quantum Computers and Quantum Programming', 'QCQP'
FROM Faculties WHERE FacultyCode = 'FP';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Experimental and Theoretical Physics', 'ETP'
FROM Faculties WHERE FacultyCode = 'FP';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Physics and Modelling', 'PM'
FROM Faculties WHERE FacultyCode = 'FP';


/* =========================
   Faculty of Chemistry (FCH)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Chemistry', 'CH'
FROM Faculties WHERE FacultyCode = 'FCH';


/* =========================
   Faculty of Culture and Arts (FCA)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Audiovisual Art Producing', 'AAP'
FROM Faculties WHERE FacultyCode = 'FCA';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Media Production', 'MP'
FROM Faculties WHERE FacultyCode = 'FCA';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Information, Library and Archival Studies', 'ILAS'
FROM Faculties WHERE FacultyCode = 'FCA';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Choral Conducting', 'CC'
FROM Faculties WHERE FacultyCode = 'FCA';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Choreography', 'CHOR'
FROM Faculties WHERE FacultyCode = 'FCA';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Acting (Drama theatre & cinema)', 'ADC'
FROM Faculties WHERE FacultyCode = 'FCA';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Theatre Studies', 'TS'
FROM Faculties WHERE FacultyCode = 'FCA';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Acting (Puppet theatre)', 'APT'
FROM Faculties WHERE FacultyCode = 'FCA';


/* =========================
   Faculty of Pedagogical Education (FPE)
   ========================= */
INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Preschool Education', 'PRE'
FROM Faculties WHERE FacultyCode = 'FPE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Primary Education', 'PE'
FROM Faculties WHERE FacultyCode = 'FPE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Primary Education (English in Primary School)', 'PEE'
FROM Faculties WHERE FacultyCode = 'FPE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Primary Education (Informatics in Primary School)', 'PEI'
FROM Faculties WHERE FacultyCode = 'FPE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Social Pedagogy', 'SPED'
FROM Faculties WHERE FacultyCode = 'FPE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Correctional Psychopedagogy', 'CPP'
FROM Faculties WHERE FacultyCode = 'FPE';

INSERT INTO Specialties (FacultyID, SpecialtyName, SpecialtyCode)
SELECT FacultyID, 'Speech Therapy', 'ST'
FROM Faculties WHERE FacultyCode = 'FPE';
