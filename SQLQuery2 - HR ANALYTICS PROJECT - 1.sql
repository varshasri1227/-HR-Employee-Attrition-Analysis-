----> The top 3 highest-paid employees in each department.
SELECT *
FROM
(
SELECT
EmployeeNumber,
Department,
JobRole,
MonthlyIncome,
ROW_NUMBER() OVER
(
PARTITION BY Department
ORDER BY MonthlyIncome DESC
) AS SalaryRank
FROM [dbo].[HR-Employee-Attrition]
) AS RankedEmployees
WHERE SalaryRank <= 3

----> employees whose MonthlyIncome is greater than the average MonthlyIncome of their own department.
SELECT
EmployeeNumber,
Department,
MonthlyIncome
FROM [dbo].[HR-Employee-Attrition] e
WHERE MonthlyIncome >
(
SELECT AVG(MonthlyIncome)
FROM [dbo].[HR-Employee-Attrition]
WHERE Department = e.Department
)

---->department has the highest attrition rate (%)
SELECT
Department,
COUNT(CASE WHEN Attrition = 1 THEN 1 END) AS EmployeesLeft,
COUNT(*) AS TotalEmployees,
ROUND(
COUNT(CASE WHEN Attrition = 1 THEN 1 END) * 100.0
/ COUNT(*),
2
) AS AttritionRate
FROM [dbo].[HR-Employee-Attrition]
GROUP BY Department
ORDER BY AttritionRate DESC;

----.average MonthlyIncome for each JobRole, sorted from highest to lowest.
select 
JobRole,avg(MonthlyIncome) as average_MonthlyIncome
from [dbo].[HR-Employee-Attrition]
group by JobRole
order by average_MonthlyIncome desc

---->JobRole has the highest average salary
select top 1
JobRole,avg(MonthlyIncome) as average_MonthlyIncome
from [dbo].[HR-Employee-Attrition]
group by JobRole
order by average_MonthlyIncome desc

---->highest-paid employee in each department
SELECT *
FROM
(select 
employeenumber,
department,
monthlyincome,
rank() over (partition by department order by  monthlyincome desc) as SalaryRank
from [dbo].[HR-Employee-Attrition]) RankedEmployees
where SalaryRank = 1

---->employees worked in the company for more than 10 years and have never been promoted.
select 
employeenumber,
department,
jobrole,
YearsAtCompany,
YearsSinceLastPromotion
from [dbo].[HR-Employee-Attrition]
where YearsAtCompany > 10 and YearsSinceLastPromotion = 0

---->employees whose salary is higher than the average salary of their own department.
select 
employeenumber,
department,
monthlyincome
from [dbo].[HR-Employee-Attrition] e
where monthlyincome >
(select avg(monthlyincome)
from [dbo].[HR-Employee-Attrition]
where department = e.department)

---->top 2 highest-paid employees in each department.
select *
from
(select 
employeenumber,
department,
monthlyincome,
rank() over (partition by department order by monthlyincome desc) as salaryrank
from [dbo].[HR-Employee-Attrition]) as rankedemployees
where salaryrank <=2

---->department with the highest total salary expense.
select
department,
count(*) as total_employees,
sum(monthlyincome) as Total_Salary_Expense,
avg(monthlyincome) as average_salary
from [dbo].[HR-Employee-Attrition]
group by Department
order by Total_Salary_Expense desc





