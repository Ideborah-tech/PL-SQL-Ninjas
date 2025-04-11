-- Create a sample dataset(Employess Table)
CREATE TABLE Employees (
EmployeeID NUMBER PRIMARY KEY,
EmployeeName VARCHAR(100),
Department VARCHAR(100),
Salary NUMBER,
JoinDate DATE
);



SELECT * FROM Employees;

-- 1. Compare Values with Previous or Next Records
-- Using LAG() and LEAD() to compare salaries with previous and next records
SELECT 
    EmployeeID, 
    EmployeeName, 
    Department, 
    Salary, 
    LAG(Salary) OVER (PARTITION BY Department ORDER BY Salary) AS PrevSalary,
    LEAD(Salary) OVER (PARTITION BY Department ORDER BY Salary) AS NextSalary,
    CASE 
        WHEN Salary > LAG(Salary) OVER (PARTITION BY Department ORDER BY Salary) THEN 'HIGHER'
        WHEN Salary < LAG(Salary) OVER (PARTITION BY Department ORDER BY Salary) THEN 'LOWER'
        ELSE 'EQUAL' 
    END AS ComparisonWithPrev
FROM Employees;