--->5 youngest employees.
select top 5
EmployeeNumber,
Age,
Department
from [dbo].[HR-Employee-Attrition]
order by  Age asc

---->department that has the highest average JobSatisfaction.
select top 1
department,avg(JobSatisfaction) as average_JobSatisfaction
from [dbo].[HR-Employee-Attrition]
group by department
order by average_JobSatisfaction desc 

---->number of employees in each Education field
select
Educationfield,count(*) as number_of_employees
from [dbo].[HR-Employee-Attrition]
group by Educationfield
order by number_of_employees desc

---->employees who work OverTime and have Attrition = 1
select 
EmployeeNumber,
Department,
JobRole,
OverTime,
Attrition
from [dbo].[HR-Employee-Attrition]
where Attrition = 1 and OverTime = 1

---->average YearsAtCompany for each department
select 
department,avg(YearsAtCompany) as average_YearsAtCompany
from [dbo].[HR-Employee-Attrition]
group by department 

---->employees whose DistanceFromHome is greater than 20 km
select
EmployeeNumber,
Department,
DistanceFromHome
from [dbo].[HR-Employee-Attrition]
where DistanceFromHome > 20

---->second highest salary in the company
SELECT *
FROM
(
SELECT
EmployeeNumber,
Department,
MonthlyIncome,
RANK() OVER
(
ORDER BY MonthlyIncome DESC
) AS SalaryRank
FROM [dbo].[HR-Employee-Attrition]
) AS RankedEmployees
WHERE SalaryRank = 2

---->employee(s) with the maximum TotalWorkingYears.
SELECT
EmployeeNumber,
Department,
TotalWorkingYears
FROM [dbo].[HR-Employee-Attrition]
WHERE TotalWorkingYears =
(
SELECT MAX(TotalWorkingYears)
FROM [dbo].[HR-Employee-Attrition]
)