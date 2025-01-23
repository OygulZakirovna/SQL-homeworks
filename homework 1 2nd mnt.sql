--Question: From the Employees table below, PER department compare the salaries
--   of employees who were hired first with ones who were hired last and show the 
--   difference.
CREATE TABLE Employees (
    employee_id int,
    first_name varchar(50),
    last_name varchar(50),
    department_id int,
    salary decimal(10, 2),
    hire_date date
)

INSERT INTO employees (employee_id, first_name, last_name, department_id, salary, hire_date)
VALUES
    (1, 'Alice', 'Johnson', 101, 75000.00, '2020-02-15'),
    (2, 'Bob', 'Smith', 102, 64000.00, '2019-07-22'),
    (3, 'Charlie', 'Brown', 103, 82000.00, '2021-03-18'),
    (4, 'Diana', 'Evans', 101, 92000.00, '2018-11-05'),
    (5, 'Eve', 'Campbell', 104, 56000.00, '2022-01-10'),
    (6, 'Frank', 'Harris', 102, 72000.00, '2020-05-29'),
    (7, 'Grace', 'Lee', 103, 81000.00, '2019-09-17'),
    (8, 'Henry', 'Green', 104, 59000.00, '2021-06-01'),
    (9, 'Isabella', 'Garcia', 101, 66000.00, '2020-12-08'),
    (10, 'Jack', 'White', 102, 87000.00, '2017-08-25'),
  (11, 'Joe', 'Smith', 101, 75000.00, '2017-08-25'),
  (12, 'Lily', 'Pete', 102, 72000.00, '2017-08-25')

  with DepartmentFirstLastHire as (
  select
 department_id,
 min(hire_date) as first_hire_date,
 max(hire_date) as last_hire_date
 from Employees
 group by department_id),
FirstLastSalaries as (select
        e.department_id,
        e.salary as first_hire_salary
    from Employees e
    inner join DepartmentFirstLastHire dflh on e.department_id = dflh.department_id AND e.hire_date = dflh.first_hire_date
    union all
        select
        e.department_id,
        e.salary as last_hire_salary
    from
        Employees e
    inner join DepartmentFirstLastHire dflh on e.department_id = dflh.department_id and e.hire_date = dflh.last_hire_date
),
SalaryComparison as (
    select
        department_id,
        max(case when first_hire_salary is not null then first_hire_salary else 0 end) as first_hire_salary,
        max(case when last_hire_salary is not null then last_hire_salary else 0 end) as last_hire_salary
    from FirstLastSalaries
    group by department_id)
select
    sc.department_id,
    sc.first_hire_salary,
    sc.last_hire_salary,
    (sc.last_hire_salary - sc.first_hire_salary) AS salary_difference
from SalaryComparison sc
order by sc.department_id;