select e.last_name, d.department_id, d.department_name
from hr.employees e left outer join hr.departments d
on (e.department_id = d.department_id)
order by e.last_name;

select e.last_name, d.department_id, d.department_name
from hr.employees e right outer join hr.departments d
on (e.department_id = d.department_id)
order by d.department_name desc;

select e.last_name, d.department_id, d.department_name
from hr.employees e full outer join hr.departments d
on (e.department_id = d.department_id)
order by d.department_name desc;
