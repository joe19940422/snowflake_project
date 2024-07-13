create database employees;

create stage mystage;

list @mystage;

select metadata$file_row_number as id ,$1, $2, $3 from @mystage/emp.csv;

create file format myfileformat
    type = csv,
    parse_header = true;

select *
from table (infer_schema(
location => '@mystage',
files => 'emp.csv',
file_format => 'myfileformat'
));

select generate_column_description(
    array_agg(object_construct(*)), 'table') as columns
from table (infer_schema(
location => '@mystage',
files => 'emp.csv',
file_format => 'myfileformat'
));


create table emp using template(
select array_agg(object_construct(*))
from table (infer_schema(
location => '@mystage',
files => 'emp.csv',
file_format => 'myfileformat'
)));

select * from emp