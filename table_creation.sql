-- Create a sample dataset(Employess Table)
CREATE TABLE Employees (
EmployeeID NUMBER PRIMARY KEY,
EmployeeName VARCHAR(100),
Department VARCHAR(100),
Salary NUMBER,
JoinDate DATE
);

-- Insert sample data into Employees
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
