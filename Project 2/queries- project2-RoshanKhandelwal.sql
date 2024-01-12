USE CSE581projects

GRANT SELECT ON SCHEMA :: [rokhande] TO Graders

-- Create 'Departments' table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL
);

-- Create 'Buildings' table
CREATE TABLE Buildings (
    BuildingID INT PRIMARY KEY,
    BuildingText VARCHAR(255) NOT NULL
);

-- Create 'Classrooms' table
CREATE TABLE Classrooms (
    ClassroomID INT PRIMARY KEY,
    BuildingID INT,
    ClassroomTypeID INT,
    Capacity INT,
    FOREIGN KEY (BuildingID) REFERENCES Buildings(BuildingID)
);

-- Create 'ClassroomType' table
CREATE TABLE ClassroomType (
    ClassroomTypeID INT PRIMARY KEY,
    ClassroomText VARCHAR(255) NOT NULL
);

-- Create 'CourseLevels' table
CREATE TABLE CourseLevels (
    CourseLevelID INT PRIMARY KEY,
    Text VARCHAR(255) NOT NULL
);

-- Create 'Courses' table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseCode VARCHAR(10) NOT NULL,
    CourseNumber INT NOT NULL,
    CourseTitle VARCHAR(255) NOT NULL,
    DepartmentID INT,
    CourseDescription TEXT,
    CourseLevelID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (CourseLevelID) REFERENCES CourseLevels(CourseLevelID)
);

-- Create 'Semesters' table
CREATE TABLE Semesters (
    SemesterID INT PRIMARY KEY,
    SemesterText VARCHAR(255) NOT NULL,
    Year INT NOT NULL,
    BeginDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

-- Create 'EnrollmentStatusType' table
CREATE TABLE EnrollmentStatusType (
    EnrollmentStatusID INT PRIMARY KEY,
    EnrollmentStatusText VARCHAR(255) NOT NULL
);

-- Create 'EnrolledStudents' table
CREATE TABLE EnrolledStudents (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    SemesterID INT,
    EnrollmentStatusID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID),
    FOREIGN KEY (EnrollmentStatusID) REFERENCES EnrollmentStatusType(EnrollmentStatusID)
);

-- Create 'CourseSchedule' table
CREATE TABLE CourseSchedule (
    ScheduleID INT PRIMARY KEY,
    CourseID INT,
    SemesterID INT,
    ClassroomID INT,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (SemesterID) REFERENCES Semesters(SemesterID),
    FOREIGN KEY (ClassroomID) REFERENCES Classrooms(ClassroomID)
);

-- Create 'CoursePrerequisites' table
CREATE TABLE CoursePrerequisites (
    CourseID INT,
    PrerequisiteCourseID INT,
    PRIMARY KEY (CourseID, PrerequisiteCourseID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (PrerequisiteCourseID) REFERENCES Courses(CourseID)
);

-- Insert dummy data for 'Departments'
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Computer Engineering'),
(2, 'Mathematics'),
(3, 'Physics');

-- Insert dummy data for 'Buildings'
INSERT INTO Buildings (BuildingID, BuildingText) VALUES
(1, 'Science Hall'),
(2, 'Liberal Arts Building'),
(3, 'Engineering Complex');

-- Insert dummy data for 'ClassroomType'
INSERT INTO ClassroomType (ClassroomTypeID, ClassroomText) VALUES
(1, 'Lecture Hall'),
(2, 'Laboratory'),
(3, 'Seminar Room');

-- Insert dummy data for 'Classrooms'
INSERT INTO Classrooms (ClassroomID, BuildingID, ClassroomTypeID, Capacity) VALUES
(1, 1, 1, 120),
(2, 2, 2, 30),
(3, 3, 3, 20);

-- Insert dummy data for 'CourseLevels'
INSERT INTO CourseLevels (CourseLevelID, Text) VALUES
(1, 'Beginner'),
(2, 'Intermediate'),
(3, 'Advanced');

-- Insert dummy data for 'Courses'
INSERT INTO Courses (CourseID, CourseCode, CourseNumber, CourseTitle, DepartmentID, CourseDescription, CourseLevelID) VALUES
(1, 'CS101', 101, 'Intro to Computer Engineering', 1, 'An introductory course on Computer Engineering fundamentals.', 1),
(2, 'MATH201', 201, 'Calculus I', 2, 'A study of limits, derivatives, integrals, and their applications.', 2),
(3, 'PHYS301', 301, 'Quantum Physics', 3, 'An exploration of the principles of quantum mechanics.', 3);

-- Insert dummy data for 'Semesters'
INSERT INTO Semesters (SemesterID, SemesterText, Year, BeginDate, EndDate) VALUES
(1, 'Fall 2023', 2023, '2023-09-01', '2023-12-15'),
(2, 'Spring 2024', 2024, '2024-01-15', '2024-05-15');

-- Insert dummy data for 'EnrollmentStatusType'
INSERT INTO EnrollmentStatusType (EnrollmentStatusID, EnrollmentStatusText) VALUES
(1, 'Enrolled'),
(2, 'Completed'),
(3, 'Withdrawn');

-- Insert dummy data for 'EnrolledStudents'
INSERT INTO EnrolledStudents (EnrollmentID, StudentID, CourseID, SemesterID, EnrollmentStatusID) VALUES
(1, 1001, 1, 1, 1),
(2, 1002, 2, 2, 1),
(3, 1003, 3, 1, 2);

-- Insert dummy data for 'CourseSchedule'
INSERT INTO CourseSchedule (ScheduleID, CourseID, SemesterID, ClassroomID) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 1, 3);

-- Insert dummy data for 'CoursePrerequisites'
INSERT INTO CoursePrerequisites (CourseID, PrerequisiteCourseID) VALUES
(2, 1),
(3, 2);


-- Create 'StudentLevel' table
CREATE TABLE StudentLevel (
    StudentLevelID INT PRIMARY KEY,
    Text VARCHAR(255) NOT NULL
);

-- Create 'StudentType' table
CREATE TABLE StudentType (
    StudentTypeID INT PRIMARY KEY,
    Text VARCHAR(255) NOT NULL
);

-- Create 'StudentStatus' table
CREATE TABLE StudentStatus (
    StudentStatusID INT PRIMARY KEY,
    Text VARCHAR(255) NOT NULL
);

-- Create 'Students' table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentTypeID INT,
    StudentStatusID INT,
    StudentLevelID INT,
    FOREIGN KEY (StudentTypeID) REFERENCES StudentType(StudentTypeID),
    FOREIGN KEY (StudentStatusID) REFERENCES StudentStatus(StudentStatusID),
    FOREIGN KEY (StudentLevelID) REFERENCES StudentLevel(StudentLevelID)
);

-- Create 'MajorMinors' table
CREATE TABLE MajorMinors (
    MajorMinorID INT PRIMARY KEY,
    MajorName VARCHAR(255) NOT NULL,
    MinorName VARCHAR(255)
);

-- Create 'Colleges' table
CREATE TABLE Colleges (
    CollegeID INT PRIMARY KEY,
    CollegeName VARCHAR(255) NOT NULL
);

-- Create 'StudentAreaOfStudy' table
CREATE TABLE StudentAreaOfStudy (
    StudentID INT,
    MajorMinorID INT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (MajorMinorID) REFERENCES MajorMinors(MajorMinorID)
);

-- Create 'JobType' table
CREATE TABLE JobType (
    JobTypeID INT PRIMARY KEY,
    Text VARCHAR(255) NOT NULL
);

-- Create 'Jobs' table
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    JobTitle VARCHAR(255) NOT NULL,
    JobDescription TEXT NOT NULL,
    JobTypeID INT,
    FOREIGN KEY (JobTypeID) REFERENCES JobType(JobTypeID)
);

-- Create 'InsuranceType' table
CREATE TABLE InsuranceType (
    InsuranceTypeID INT PRIMARY KEY,
    Text VARCHAR(255) NOT NULL
);

-- Create 'CoverType' table
CREATE TABLE CoverType (
    CoverTypeID INT PRIMARY KEY,
    Text VARCHAR(255) NOT NULL
);

-- Create 'Gender' table
CREATE TABLE Gender (
    GenderID INT PRIMARY KEY,
    Text VARCHAR(50) NOT NULL
);

-- Create 'Race' table
CREATE TABLE Race (
    RaceID INT PRIMARY KEY,
    Text VARCHAR(50) NOT NULL
);

-- Create 'State' table
CREATE TABLE State (
    StateID INT PRIMARY KEY,
    Text VARCHAR(50) NOT NULL
);

-- Create 'Country' table
CREATE TABLE Country (
    CountryID INT PRIMARY KEY,
    Text VARCHAR(50) NOT NULL
);

-- Create 'Address' table
CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    Street1 VARCHAR(255) NOT NULL,
    Street2 VARCHAR(255),
    City VARCHAR(255) NOT NULL,
    StateID INT,
    CountryID INT,
    Zip VARCHAR(10) NOT NULL,
    FOREIGN KEY (StateID) REFERENCES State(StateID),
    FOREIGN KEY (CountryID) REFERENCES Country(CountryID)
);

-- Create 'PersonInfo' table
CREATE TABLE PersonInfo (
    PersonID INT PRIMARY KEY,
    NTID VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    SSN VARCHAR(11) NOT NULL,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DOB DATE NOT NULL,
    GenderID INT,
    RaceID INT,
    Email VARCHAR(255) NOT NULL,
    MailingAddressID INT,
    Cellphone VARCHAR(15) NOT NULL,
    FOREIGN KEY (GenderID) REFERENCES Gender(GenderID),
    FOREIGN KEY (RaceID) REFERENCES Race(RaceID),
    FOREIGN KEY (MailingAddressID) REFERENCES Address(AddressID)
);

-- Create 'EmployeeInfo' table
CREATE TABLE EmployeeInfo (
    EmployeeID INT PRIMARY KEY,
    AnnualSalary DECIMAL(10,2) NOT NULL,
    PersonID INT,
    FOREIGN KEY (PersonID) REFERENCES PersonInfo(PersonID)
);

-- Create 'Benefits' table
CREATE TABLE Benefits (
    BenefitID INT PRIMARY KEY,
    EmployeeID INT,
    InsuranceTypeID INT,
    CoverTypeID INT,
    EmployeePremium DECIMAL(10,2) NOT NULL,
    EmployerPremium DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES EmployeeInfo(EmployeeID),
    FOREIGN KEY (InsuranceTypeID) REFERENCES InsuranceType(InsuranceTypeID),
    FOREIGN KEY (CoverTypeID) REFERENCES CoverType(CoverTypeID)
);

-- Create 'EmployeeAndJob' table
CREATE TABLE EmployeeAndJob (
    EmployeeID INT,
    JobID INT,
    PRIMARY KEY (EmployeeID, JobID),
    FOREIGN KEY (EmployeeID) REFERENCES EmployeeInfo(EmployeeID),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID)
);


-- Insert dummy data for 'StudentLevel'
INSERT INTO StudentLevel (StudentLevelID, Text) VALUES
(1, 'Freshman'),
(2, 'Sophomore'),
(3, 'Junior'),
(4, 'Senior');

-- Insert dummy data for 'StudentType'
INSERT INTO StudentType (StudentTypeID, Text) VALUES
(1, 'Full-time'),
(2, 'Part-time'),
(3, 'Exchange');

-- Insert dummy data for 'StudentStatus'
INSERT INTO StudentStatus (StudentStatusID, Text) VALUES
(1, 'Active'),
(2, 'Graduated'),
(3, 'Suspended');

-- Insert dummy data for 'Students'
INSERT INTO Students (StudentID, StudentTypeID, StudentStatusID, StudentLevelID) VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 2, 4);

-- Insert dummy data for 'MajorMinors'
INSERT INTO MajorMinors (MajorMinorID, MajorName, MinorName) VALUES
(1, 'Computer Engineering', 'Mathematics'),
(2, 'Physics', 'Chemistry'),
(3, 'Political Science', 'US Democracy');

-- Insert dummy data for 'Colleges'
INSERT INTO Colleges (CollegeID, CollegeName) VALUES
(1, 'College of Engineering'),
(2, 'College of Science'),
(3, 'VPA');

-- Insert dummy data for 'StudentAreaOfStudy'
INSERT INTO StudentAreaOfStudy (StudentID, MajorMinorID) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert dummy data for 'JobType'
INSERT INTO JobType (JobTypeID, Text) VALUES
(1, 'Technical'),
(2, 'Administrative'),
(3, 'Academic');

-- Insert dummy data for 'Jobs'
INSERT INTO Jobs (JobID, JobTitle, JobDescription, JobTypeID) VALUES
(1, 'Software Developer', 'Develops and maintains software applications.', 1),
(2, 'Lab Technician', 'Manages laboratory and performs experiments.', 2),
(3, 'Professor', 'Teaches courses and conducts research.', 3);

-- Insert dummy data for 'Gender'
INSERT INTO Gender (GenderID, Text) VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Non-Binary');

-- Insert dummy data for 'Race'
INSERT INTO Race (RaceID, Text) VALUES
(1, 'Caucasian'),
(2, 'African American'),
(3, 'Asian');

-- Insert dummy data for 'Country'
INSERT INTO Country (CountryID, Text) VALUES
(1, 'USA'),
(2, 'Canada'),
(3, 'India');

-- Insert dummy data for 'State'
INSERT INTO State (StateID, Text) VALUES
(1, 'MA'),
(2, 'NY'),
(3, 'DC');

-- Insert dummy data for 'Address'
INSERT INTO Address (AddressID, Street1, Street2, City, StateID, CountryID, Zip) VALUES
(1, '6128 Westcott St', 'Apt 101', 'Syracuse', 1, 1, '12345'),
(2, '1234 Clarendon St',NULL , 'Columbus', 2, 1, '12345'),
(3, '9872 Gleen', NULL, 'Loas', 1, 2, '12345');

-- Insert dummy data for 'PersonInfo'
INSERT INTO PersonInfo (PersonID, NTID, Password, SSN, FirstName, LastName, DOB, GenderID, RaceID, Email, MailingAddressID, Cellphone) VALUES
(1, 'ntid001', 'pass123', '123-45-6789', 'Abey', 'Rit', '1990-01-01', 1, 1, 'Abey.Rit@example.com', 1, '315-1234'),
(2, 'ntid002', 'pass456', '234-56-7890', 'Karol', 'Shebby', '1990-02-02', 2, 2, 'Karol.Shebby@example.com', 2, '315-4567'),
(3, 'ntid003', 'pass789', '345-67-8901', 'you', 'i', '1990-03-03', 2, 3, 'you.1@example.com', 3, '315-7890');

-- Insert dummy data for 'EmployeeInfo'
INSERT INTO EmployeeInfo (EmployeeID, AnnualSalary, PersonID) VALUES
(1, 10000.00, 1),
(2, 20000.00, 2),
(3, 30000.00, 3);

-- Insert dummy data for 'CoverType'
INSERT INTO CoverType (CoverTypeID, Text) VALUES
(1, 'Employee Only'),
(2, 'Family Plan');

-- Insert dummy data for 'InsuranceType'
INSERT INTO InsuranceType (InsuranceTypeID, Text) VALUES
(1, 'Health Insurance'),
(2, 'Dental Insurance'),
(3, 'Vision Insurance');

-- Insert dummy data for 'EmployeeAndJob'
INSERT INTO EmployeeAndJob (EmployeeID, JobID) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Insert dummy data for 'Benefits'
INSERT INTO Benefits (BenefitID, EmployeeID, InsuranceTypeID, CoverTypeID, EmployeePremium, EmployerPremium) VALUES
(1, 1, 1, 1, 100.00, 400.00),
(2, 2, 2, 2, 200.00, 500.00),
(3, 3, 1, 2, 300.00, 600.00);

-- More data Insertion on Tables
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(4, 'Biology'),
(5, 'Chemistry'),
(6, 'English');

INSERT INTO Buildings (BuildingID, BuildingText) VALUES
(4, 'Life Sciences'),
(5, 'Life Sciences'),
(6, 'VPA');

INSERT INTO ClassroomType (ClassroomTypeID, ClassroomText) VALUES
(4, 'Biology Lab'),
(5, 'Chemistry Lab'),
(6, 'Auditorium');

INSERT INTO Classrooms (ClassroomID, BuildingID, ClassroomTypeID, Capacity) VALUES
(4, 4, 4, 40),
(5, 5, 5, 25),
(6, 6, 6, 150);

INSERT INTO CourseLevels (CourseLevelID, Text) VALUES
(4, 'Graduate'),
(5, 'Postgraduate'),
(6, 'Doctoral');

INSERT INTO Courses (CourseID, CourseCode, CourseNumber, CourseTitle, DepartmentID, CourseDescription, CourseLevelID) VALUES
(4, 'BIO600', 101, 'Introduction to Biology', 4, 'Basics of biological concepts.', 1),
(5, 'CHEM700', 101, 'Introduction to Chemistry', 5, 'Basics of Chemistry concepts.', 1),
(6, 'ENG800', 101, 'Introduction to French Sonet', 6, 'Study of French Sonet Music Period.', 1);

INSERT INTO Semesters (SemesterID, SemesterText, Year, BeginDate, EndDate) VALUES
(3, 'Fall 2024', 2024, '2024-03-10', '2024-09-15'),
(4, 'Fall 2024', 2024, '2024-03-11', '2024-01-15'),
(5, 'Summer 2025', 2025, '2025-09-12', '2025-08-15');

INSERT INTO EnrollmentStatusType (EnrollmentStatusID, EnrollmentStatusText) VALUES
(4, 'Pending'),
(5, 'Failed'),
(6, 'Passed');

INSERT INTO EnrolledStudents (EnrollmentID, StudentID, CourseID, SemesterID, EnrollmentStatusID) VALUES
(4, 1004, 4, 3, 4),
(5, 1005, 5, 4, 5),
(6, 1006, 6, 5, 6);

INSERT INTO CourseSchedule (ScheduleID, CourseID, SemesterID, ClassroomID) VALUES
(4, 4, 3, 4),
(5, 5, 4, 5),
(6, 6, 5, 6);

INSERT INTO CoursePrerequisites (CourseID, PrerequisiteCourseID) VALUES
(4, 3),
(5, 4),
(6, 5);




SELECT * from Departments
SELECT * from Buildings
SELECT * from Classrooms
SELECT * from ClassroomType
SELECT * from CourseLevels
SELECT * from Courses
SELECT * from Semesters
SELECT * from EnrollmentStatusType
SELECT * from EnrolledStudents
SELECT * from CourseSchedule
SELECT * from CoursePrerequisites

SELECT * from StudentLevel
SELECT * from StudentType
SELECT * from StudentStatus
SELECT * from Students
SELECT * from MajorMinors
SELECT * from Colleges
SELECT * from StudentAreaOfStudy
SELECT * from JobType
SELECT * from Jobs
SELECT * from InsuranceType
SELECT * from CoverType
SELECT * from Gender
SELECT * from Race
SELECT * from Country
SELECT * from Address
SELECT * from PersonInfo
SELECT * from EmployeeInfo
SELECT * from Benefits
SELECT * from EmployeeAndJob







