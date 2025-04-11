-- Create a sample dataset(Employess Table)
CREATE TABLE Employees (
EmployeeID NUMBER PRIMARY KEY,
EmployeeName VARCHAR(100),
Department VARCHAR(100),
Salary NUMBER,
JoinDate DATE
);

INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary, JoinDate)
VALUES (1, 'Alice', 'IT', 9000, TO_DATE('2021-03-15', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary, JoinDate)
VALUES (2, 'Bob', 'IT', 8500, TO_DATE('2020-07-10', 'YYYY-MM-DD'));


INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary, JoinDate)
VALUES (3, 'Charlie', 'IT', 8500, TO_DATE('2021-06-20', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary, JoinDate)
VALUES (4, 'David', 'IT', 8000, TO_DATE('2019-09-25', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary, JoinDate)
VALUES (5, 'Eve', 'HR', 7500, TO_DATE('2022-01-05', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary, JoinDate)
VALUES (6, 'Frank', 'HR', 7200, TO_DATE('2021-08-14', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, EmployeeName, Department, Salary, JoinDate)
VALUES (7, 'Grace', 'HR', 7000, TO_DATE('2020-11-30', 'YYYY-MM-DD'));

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

-- 2. Ranking Data within a Category
-- Using RANK() and DENSE_RANK() to rank employees by salary within each department
SELECT 
    EmployeeID, 
    EmployeeName, 
    Department, 
    Salary,
    RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Rank,
    DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS DenseRank
FROM Employees;

-- 3. Identifying Top 3 Records per Department
-- Fetching top 3 highest salaries per department
WITH RankedEmployees AS (
    SELECT 
        EmployeeID, 
        EmployeeName, 
        Department, 
        Salary,
        RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Rank
    FROM Employees
)
SELECT * FROM RankedEmployees WHERE Rank <= 3;

-- Handling duplicates:
-- RANK() ensures employees with the same salary receive the same rank, preventing unintended omissions.