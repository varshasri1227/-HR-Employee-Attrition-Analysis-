select top 5 *
from [dbo].[HR-Employee-Attrition]

select
count(*)
from [dbo].[HR-Employee-Attrition]

select 
count(*)
from [dbo].[HR-Employee-Attrition]
where Attrition = 1;

select 
count(*)
from [dbo].[HR-Employee-Attrition]
where Attrition = 0;

select 
count(*),Department
from [dbo].[HR-Employee-Attrition]
group by department 

select 
Department,avg(MonthlyIncome) as average_MonthlyIncome
from [dbo].[HR-Employee-Attrition]
group by Department

select 
department ,count(*) as emp_left_from_department 
from [dbo].[HR-Employee-Attrition]
where Attrition = 1
group by Department

select 
Department,avg(MonthlyIncome) as highest_average_monthly_income
from [dbo].[HR-Employee-Attrition]
group by department 
order by highest_average_monthly_income desc

select 
Department,avg(MonthlyIncome) as average_MonthlyIncome
from [dbo].[HR-Employee-Attrition]
where Attrition = 1
group by department 

select top 5
EmployeeNumber,
Department,
JobRole,
monthlyincome
from [dbo].[HR-Employee-Attrition]
order by monthlyincome desc

select 
EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome
FROM [dbo].[HR-Employee-Attrition]
where MonthlyIncome >
( select avg(MonthlyIncome) as average_MonthlyIncome 
from [dbo].[HR-Employee-Attrition])

select 
EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    rank() over (order by monthlyincome desc) as SalaryRank
 from [dbo].[HR-Employee-Attrition]

    select top 3
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome
    from [dbo].[HR-Employee-Attrition]
    order by MonthlyIncome desc

    select top 1
    department,avg(monthlyincome) as average_monthly_income
    from [dbo].[HR-Employee-Attrition]
    group by Department
    order by  average_monthly_income asc

    select
    JobRole,count(*) as total_employees
    from [dbo].[HR-Employee-Attrition]
    group by jobrole
    order by total_employees desc

    select
    department,max(monthlyincome) as max_monthlyincome
    from [dbo].[HR-Employee-Attrition]
    group by department

    select
    department,min(monthlyincome) as min_monthlyincome
    from [dbo].[HR-Employee-Attrition]
    group by department

    select 
    * 
    from [dbo].[HR-Employee-Attrition]
    where monthlyincome <
    (select 
    avg(monthlyincome) 
    from [dbo].[HR-Employee-Attrition])

    SELECT *
    FROM
    (
    SELECT
        MonthlyIncome,
        DENSE_RANK() OVER (ORDER BY MonthlyIncome DESC) AS SalaryRank
    FROM [dbo].[HR-Employee-Attrition]
    ) AS SalaryRanks
    WHERE SalaryRank = 2;

    select 
    monthlyincome,
    rank() over (partition by department order by monthlyincome desc) as highest_salary
    from [dbo].[HR-Employee-Attrition]

    select 
    department,avg(monthlyincome) as avg_monthlyincome
    from [dbo].[HR-Employee-Attrition]
    group by department
    having avg(monthlyincome) > 7000
    

    select top 1
    jobrole,count(*) as highest_number_of_employees
    from [dbo].[HR-Employee-Attrition]
    where attrition = 1
    group by jobrole
    order by highest_number_of_employees desc

    select 
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    row_number() over ( order by MonthlyIncome desc) as salary_rownumber
    from [dbo].[HR-Employee-Attrition]

    select
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    DENSE_RANK() over (order by monthlyincome desc) as salary_denserank
    from [dbo].[HR-Employee-Attrition]

    select
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    case
    when monthlyincome >= 15000 then 'High Salary'
    when monthlyincome between 7000 and 14999 then 'Medium  Salary'
    else 'Low Salary'
    end as SalaryCategory
    from [dbo].[HR-Employee-Attrition]

    select 
    case
    when MonthlyIncome >= 15000 then 'High Salary'
    when MonthlyIncome between 7000 and 14999 then 'Medium Salary'
    else 'Low Salary' 
    end as salary_category,
    count(*) as total_number_of_employees
    from [dbo].[HR-Employee-Attrition]
    group by 
    case
    when MonthlyIncome >= 15000 then 'High Salary'
    when MonthlyIncome between 7000 and 14999 then 'Medium Salary'
    else 'Low Salary' 
    end






    