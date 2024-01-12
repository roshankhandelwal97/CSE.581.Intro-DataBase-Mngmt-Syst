
--SP 1 to use cursor
CREATE PROCEDURE sp_GetAllCoursesByDepartment
    @DepartmentID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @CourseID INT, @CourseTitle VARCHAR(255);
    DECLARE course_cursor CURSOR FOR
    SELECT CourseID, CourseTitle
    FROM Courses
    WHERE DepartmentID = @DepartmentID;

    OPEN course_cursor;
    FETCH NEXT FROM course_cursor INTO @CourseID, @CourseTitle;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Course ID: ' + CAST(@CourseID AS VARCHAR) + ', Title: ' + @CourseTitle;
        FETCH NEXT FROM course_cursor INTO @CourseID, @CourseTitle;
    END;

    CLOSE course_cursor;
    DEALLOCATE course_cursor;
END;
GO

-- SP 2 update data in table
CREATE PROCEDURE sp_UpdateAnnualSalary
    @EmployeeID INT,
    @NewSalary DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;

    IF @NewSalary <= 0
    BEGIN
        PRINT 'Invalid salary amount.';
        RETURN;
    END

    UPDATE EmployeeInfo
    SET AnnualSalary = @NewSalary
    WHERE EmployeeID = @EmployeeID;

    PRINT 'Salary updated successfully.';
END;
GO

-- SP 3 to delete data from table
CREATE PROCEDURE sp_DeleteEmployee
    @EmployeeID INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM EmployeeInfo
    WHERE EmployeeID = @EmployeeID;

    PRINT 'Employee deleted successfully.';
END;
GO

-- SP 4 of your own choice
CREATE PROCEDURE sp_UpdateEmployeeJob
    @EmployeeID INT,
    @NewJobID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the employee exists
    IF NOT EXISTS (SELECT 1 FROM EmployeeInfo WHERE EmployeeID = @EmployeeID)
    BEGIN
        PRINT 'Employee does not exist.';
        RETURN;
    END

    -- Check if the new job ID exists
    IF NOT EXISTS (SELECT 1 FROM Jobs WHERE JobID = @NewJobID)
    BEGIN
        PRINT 'The new job ID does not exist.';
        RETURN;
    END

    -- Check if the job assignment already exists
    IF EXISTS (SELECT 1 FROM EmployeeAndJob WHERE EmployeeID = @EmployeeID AND JobID = @NewJobID)
    BEGIN
        PRINT 'The employee is already assigned to this job.';
        RETURN;
    END

    -- Update the employee's job record
    BEGIN TRY
        -- Start transaction
        BEGIN TRANSACTION;

        -- Update the current job to the new job
        UPDATE EmployeeAndJob
        SET JobID = @NewJobID
        WHERE EmployeeID = @EmployeeID;

        -- Commit the transaction
        COMMIT TRANSACTION;

        PRINT 'Employee job updated successfully.';
    END TRY
    BEGIN CATCH
        -- Rollback the transaction in case of error
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred during the job update.';
    END CATCH;
END;
GO


