--Create a view named Benefits
CREATE VIEW EmpBenefits AS
SELECT 
    e.EmployeeID,
    p.FirstName,
    p.LastName,
    i.Text AS InsuranceType,
    c.Text AS CoverageType,
    b.EmployeePremium,
    b.EmployerPremium
FROM EmployeeInfo e
JOIN PersonInfo p ON e.PersonID = p.PersonID
JOIN Benefits b ON e.EmployeeID = b.EmployeeID
JOIN InsuranceType i ON b.InsuranceTypeID = i.InsuranceTypeID
JOIN CoverType c ON b.CoverTypeID = c.CoverTypeID;
GO
