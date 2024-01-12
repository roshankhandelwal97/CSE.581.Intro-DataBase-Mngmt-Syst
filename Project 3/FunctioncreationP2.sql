--Create one function which can be executed by graders
CREATE FUNCTION fn_GetTotalStudentsInCourse(@CourseID INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalStudents INT;

    SELECT @TotalStudents = COUNT(*)
    FROM EnrolledStudents
    WHERE CourseID = @CourseID;

    RETURN @TotalStudents;
END;
GO
