# NVBD Coursework — Variant 1 “Student (Deanery)” Data Warehouse & BI System

This repository contains my coursework project for the subject **“Very Large Databases (Надвеликі бази даних)”**. The goal of the project is to design and implement a full-cycle data management and analytics system based on **Microsoft SQL Server technologies**: **SQL Server (OLTP + DW), SSIS (ETL), SSAS (OLAP cube), SSRS (analytical reports)**. The selected domain is **Variant 1: “Student (Deanery)”**, which models the deanery information system including students, groups, subjects, teachers, grades, hobbies, dorm rooms, and library book loans. The solution supports large-scale data volumes (≥10,000 students and ≥500,000 grade records) and contains historical data for **5 years**. The project is structured according to the official submission requirements: SQL scripts for database creation and logic (constraints, triggers, procedures), data generation scripts, full SSIS/SSAS/SSRS projects, and documentation with screenshots. :contentReference[oaicite:0]{index=0}

---

## 1. Project Scope (Variant 1 Requirements)

**Domain:** Student Deanery System  
**Main entities:** Students, Groups, Subjects, Teachers, Grades, Hobbies, Books, Dorm Rooms  
**Specific requirements implemented:**
- At least **10,000 students**
- At least **500,000 grade records**
- **5-year history** of academic performance and related records

---

## 2. High-Level Architecture

The solution is divided into 4 major layers:

1. **OLTP Database (Source System)**
   - Normalized relational model (Deanery transactional database)
   - Includes constraints, business rules, triggers and stored procedures

2. **Data Warehouse (DW)**
   - Star/Snowflake schema optimized for analytics
   - Fact and dimension tables built from OLTP sources

3. **ETL Layer (SSIS)**
   - Full load and/or incremental logic (depending on package)
   - Cleansing, transformations, logging, and audit tables

4. **Analytics Layer**
   - **SSAS Multidimensional Cube**
   - **SSRS Reports** connected to the cube / DW

---

## 3. Database Model (OLTP)

The OLTP schema includes the following key tables:
- **Faculties** → list of faculties
- **Specialties** → specialties linked to faculties
- **Groups** → groups linked to specialties
- **Students** → students linked to groups
- **Teachers** → teachers linked to faculties
- **Subjects** → list of academic subjects
- **TeacherSubjects** → many-to-many between Teachers and Subjects
- **Grades** → fact-like table of student grades (linked to student, subject-teacher relation, teacher)
- **Hobbies**, **StudentHobbies**
- **Books**, **BookLoans**
- **DormRooms**, **DormStays**

Relationships were designed to ensure referential integrity, and the database is prepared for large-scale generation while maintaining realistic data consistency.

---

## 4. Repository Structure


The repository follows the required structure:

├── README.md
├── Documentation/
│ └── Report_<YourName>.pdf
├── Database/
│ ├── CREATE_DATABASE.sql
│ ├── CREATE_TABLES.sql
│ ├── CREATE_CONSTRAINTS.sql
│ ├── CREATE_TRIGGERS.sql
│ └── CREATE_PROCEDURES.sql
├── DataGeneration/
│ ├── generator_scripts/
│ ├── datasets/
│ └── Redgate_configs/
├── SSIS_Projects/
│ └── *.dtsx (ETL packages)
├── SSAS_Projects/
│ └── Cube + Dimensions (SSAS project)
└── SSRS_Projects/
└── *.rdl (Reports)

## 5. How to Run the Project

### 5.1 Prerequisites
Install the following software:
- **Microsoft SQL Server** (2017/2019/2022 recommended)
- **SQL Server Management Studio (SSMS)**
- **Visual Studio + SQL Server Data Tools (SSDT)**
- SSIS / SSAS / SSRS components installed
- (Optional) **Redgate SQL Data Generator** for faster synthetic data generation

---

### 5.2 Step 1 — Create Database and Tables
Run SQL scripts in this order:

1. `Database/CREATE_DATABASE.sql`
2. `Database/CREATE_TABLES.sql`
3. `Database/CREATE_CONSTRAINTS.sql`
4. `Database/CREATE_TRIGGERS.sql`
5. `Database/CREATE_PROCEDURES.sql`

After this step you will have an empty OLTP database schema.

---

### 5.3 Step 2 — Generate and Load OLTP Data
Data generation is stored inside `DataGeneration/`.

The generation approach supports:
- large volumes of students and grades
- realistic distribution across faculties/specialties/groups
- correct FK relations (students → groups → specialties → faculties)
- multi-year date distributions for grades and loans

After generation, verify volumes (example checks):
- Students count ≥ 10,000
- Grades count ≥ 500,000
- 5-year range in date fields

---

### 5.4 Step 3 — Run SSIS ETL to Build the Data Warehouse
1. Open the SSIS solution/project inside `SSIS_Projects/`
2. Set correct Connection Managers (OLTP source + DW destination)
3. Execute packages in the logical order:
   - Dimensions load (Faculty, Specialty, Group, Student, Subject, Teacher, Time, etc.)
   - Fact tables load (Grades, BookLoans, DormStays)

ETL includes:
- data cleansing
- type conversions
- derived columns (e.g., age groups, academic year, flags)
- lookup transformations for surrogate keys
- logging and audit control tables

---

### 5.5 Step 4 — Deploy and Process SSAS Cube
1. Open the SSAS project inside `SSAS_Projects/`
2. Update Data Source connection string to DW
3. Deploy the project
4. Run **Process Full** for dimensions and measure groups

Cube contains:
- Time dimension with hierarchies (Year → Quarter → Month → Day)
- Student and organizational dimensions (Faculty/Specialty/Group)
- Measures: counts, averages, min/max, calculated measures, ranking, time intelligence (YTD/YoY)

---

### 5.6 Step 5 — Deploy SSRS Reports
1. Open SSRS project inside `SSRS_Projects/`
2. Configure Shared Data Source (SSAS cube or DW)
3. Deploy reports to Report Server
4. Validate report parameters and drill-down functionality

---

## 6. Required SSRS Reports (Implemented)

The solution includes the mandatory analytical reports:

1. **Students list by groups**
   - grouped list of students by faculty/specialty/group
   - sorting and filtering supported

2. **Student ranking (with range parameter)**
   - ranking based on average grade
   - supports parameter range (Top N / grade range / percentile)

3. **Book overdue report (> 1 year)**
   - identifies overdue loans where return date is missing or overdue period exceeds 1 year

4. **Student certificate: ranking & scholarship eligibility**
   - selected student detail report
   - includes GPA, rank in group/specialty, and scholarship decision rule

5. **Performance analysis by subjects and teachers**
   - average grade per subject/teacher
   - distribution analytics and trends over time

Reports include parameters (dropdowns, cascading parameters faculty→group→student), formatting, and interactive features (drill-down, sorting, totals, export options).

---

## 7. Screenshots and Documentation

All documentation is stored in:
- `Documentation/Report_<YourName>.pdf`

It includes:
- ER diagram (conceptual/logical)
- DW schema (star/snowflake)
- ETL workflow overview
- SSAS cube design screenshots
- SSRS report screenshots and descriptions
- performance notes and conclusions

---

## 8. Notes About Commits

The repository uses meaningful commit messages such as:
- `Add OLTP schema scripts (tables + constraints)`
- `Add Redgate generation config and datasets`
- `Implement SSIS ETL packages for DW load`
- `Add SSAS cube with measures and hierarchies`
- `Create SSRS reports with parameters and drill-down`
- `Add final documentation PDF`

---
