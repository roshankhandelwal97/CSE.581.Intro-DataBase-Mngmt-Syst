**Description**

This repository encompasses the coursework for CSE 581, Introduction to Database Management Systems at Syracuse University. It details the creation and manipulation of databases, demonstrating core DBMS principles. The content includes three substantial projects: designing a university system database, implementing the design with SQL, and enhancing functionality with advanced features like stored procedures. Additionally, it features 15 labs ranging from basic SQL queries to complex database operations. This collection serves as a practical showcase of database management skills and theoretical application.

**Projects**

This repository includes three Projects:

1. **Project 1**

**Summary:** Involves creating a database design for a university system. The assignment requires the normalization of data to the second or third normal form, ensuring efficient data organization and retrieval. The database design encompasses tables for students, employees, semesters, and courses, with detailed attributes for each entity, such as personal information, job details, course schedules, and enrollment data. Key relationships between these entities are also established through primary and foreign keys, encapsulating the complexity of the university's operational data.

**Key Concepts:** Entity-Relationship Model, Normalization, Primary and Foreign Keys, Relational Schema

1. **Project 2**

**Summary:** Involves the practical implementation of the database design created in Project 1. The task includes:

- Implementing the database design into the Database CSE581projects, ensuring data types are appropriate for the business context.
- Making and documenting any design modifications.
- Populating the tables with dummy data that reflect the relationships and the business logic.
- Providing SQL scripts for table creation, data insertion, and modifications.
- Granting SELECT permissions on the schema to the graders.
- Preparing and submitting a text file with SELECT queries against all tables.

The project is designed to demonstrate the ability to realize a DBMS from a conceptual design to a functioning database with test data, taking into consideration the business requirements outlined in the initial project.

File Structure:

1. Project 2 - Question.docx: Outlines the requirements and tasks for Project 2.
2. Project 2 - RoshanKhandelwal- Report.docx: Contains the report and documentation for Project 2.
3. queries- project2-RoshanKhandelwal.sql: SQL script with the queries used in Project 2.
4. selectQueries-project2-RoshanKhandelwal.txt: Text file with SELECT queries to run against all tables.

**Key Concepts:** Database Implementation, SQL DDL, SQL DML, Normalization, Relational Schema Refinement, Indexing, Permissions and Security, Query Optimization, Transaction Management, Data Integrity Constraints

1. **Project 3**

**Summary:** Extends the work from Project 2 by implementing advanced DBMS functionalities. The task includes:

- Creating four stored procedures for different database operations including use of cursors, updating and deleting data, and performing a custom business action.
- Developing a user-defined function to calculate and return specific data (total number of students in a course).
- Constructing a view named "Benefits" that compiles information across multiple tables to present a comprehensive overview of employee benefits.

File Structure:

1. Project 3- Question.docx - The document detailing the requirements and questions for Project 3.
2. Project 3 - RoshanKhandelwal- Report- The report document for Project 3, containing explanations and documentation of the work done.
3. executeselect.txt - A text file with SQL SELECT statements to be executed against the views, functions, and stored procedures.
4. FunctioncreationP2.sql - SQL script for creating the user-defined function.
5. grantP2.sql - SQL script for granting permissions to the 'Graders' role.
6. SPCreationP2.sql - SQL script for creating the stored procedures required in Project 3.
7. viewcreationP2.sql - SQL script for creating the 'Benefits' view.

**Key Concepts:** Stored Procedures, User-Defined Functions, Views, Cursors, Transaction Control, Permission Management, SQL Scripting, Data Retrieval, Data Manipulation, Data Definition, Business Logic Implementation.

**Labs**

This repository includes 15 Labs. Here are the summaries and key features for each lab:

**Lab 01 - In Class Design Lab**

This lab involved creating a sample Entity-Relationship (ER) diagram for a database design. The deliverable was a Microsoft Word or Visio drawing with tables, primary keys, foreign keys, and relationships.

Key concepts: Entity-Relationship Diagram, Database Design, Primary Key, Foreign Key, Relationships

**Lab 02 - Design Lab**

In this lab, students were tasked with creating an ER diagram for a small bakery's database. The focus was on capturing the bakery's operations, including customer tracking, supplier interactions, product catalog, ingredient usage, and sales records.

Key concepts: ER Diagram, Database Design for Business Operations, Customer and Supplier Relationship Management

**Lab 03 - Hello World**

This lab introduced the basic connection to the class SQL Server. Students were required to connect to the server, with deliverables including screenshots showing successful login and connection to the database.

Key concepts: SQL Server Connection, Database Access, Server Navigation

**Lab 04 - Basic Selects**

The lab focused on performing basic SQL SELECT statements against the Northwind database, aiming to familiarize students with data retrieval operations from different tables, ordering results, and filtering data based on specific criteria.

Key concepts: SELECT statement, Data Retrieval, Sorting, Filtering

**Lab 05 - System Functions**

Involves use of SQL system functions to manipulate data such as string formatting, date calculations, and aggregate functions to analyze data, like finding the average, minimum, and maximum values.

Key concepts: String Functions, Date Functions, Aggregate Functions

**Lab 06 - Selects With Datatypes**

Involves performing SQL SELECT statements on the Northwind database with a focus on date and string data types, including data filtering based on date ranges, counting records by year, and using string patterns to filter data.

Key concepts: Data Types, Date Functions, Aggregate Functions, Pattern Matching

**Lab 07 – Tables**

The objective was to create several tables within a database, defining columns, types, keys, and constraints. Students had to execute SQL scripts for table creation, provide screenshots of the process, and grant specific permissions to the graders.

Key concepts: Table Creation, SQL DDL, Data Types, Primary Keys, Constraints, Permissions

**Lab 08 - Data Manipulation**

Lab 08 tasked students with populating tables with data, then using UPDATE and DELETE statements to modify the data. This required understanding of data manipulation commands and the implications of data changes.

Key concepts: Data Insertion, Data Update, Data Deletion, SQL DML

**Lab 09 - Table Joins**

This lab required students to perform various types of JOIN operations in SQL, including INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN. The exercises helped students understand how to link tables together to form complex queries and analyze data from multiple related tables.

Key concepts: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN, Complex Queries

**Lab 10 – Views**

The lab focused on creating SQL views to simplify data retrieval. Students were tasked with constructing views that join multiple tables and selecting data from these views, including filtering for specific criteria.

Key concepts: View Creation, Data Retrieval from Views, Table Joins, Data Filtering

**Lab 11 - Stored Procedures**

This lab focuses on creating and executing a stored procedure in the CSE581labs database. The procedure involves checking and managing student enrollments in courses, handling cases where a student is already enrolled, where a course lacks an assigned faculty, and successful enrollment.

Key Concepts: Stored Procedures, Conditional Logic, Database Manipulation, Script Execution, SQL Procedures.

**Lab 12 - Functions**

This lab involved creating a function in SQL to calculate and return letter grade descriptions based on numerical grades and course IDs. The function uses data from CourseGrade and LetterGrades tables to determine the correct letter grade.

Key Concepts: User-Defined Functions, Data Retrieval, SQL Functions, Conditional Logic, Table Joins.

**Lab 13 – Triggers**

Summary: This lab involves creating a trigger for the Enrollment table to manage the 'OpenSeats' count in the Courses table. The trigger responds to insert, delete, and update operations, ensuring that the OpenSeats count is accurate when students are added, removed, or switch courses.

Key Concepts: Triggers, SQL Trigger Creation, Data Integrity, Event-Driven Actions.

**Lab 14 – Cursors**

This lab focuses on creating a function using a cursor to walk through the Enrollment table and calculate the average grades for each student. The function, taking a student ID as a parameter, calculates that student's average grade, showcasing the usage of cursors in data computation.

Key Concepts: Cursors, SQL Function Creation, Data Calculation, Aggregate Functions.

**Lab 15 - Error Handling**

Lab 15 involves writing a stored procedure with error handling capabilities. The procedure accepts two parameters, performs a division operation, and includes error handling to output a message and return a specific value (-1) if an error occurs, such as division by zero.

Key Concepts: Stored Procedures, Error Handling, Conditional Logic, Exception Management.

**Contributors**

- Roshan Khandelwal
