create or replace procedure test2
(v_stu_no in student.stu_no%type, 
v_stu_grade in student.stu_grade%type)
is
begin
    update student
    set stu_grade=v_stu_grade
    where stu_no=v_stu_no;
end test2;
/

execute test2(20153088, 3);

select * from student;

drop procedure test2; -- 프로시저 삭제
drop procedure test3;

create or replace procedure test3
(v_stu_no in student.stu_no%type,
v_stu_name out student.stu_name%type)
is
begin
    select stu_name
    into v_stu_name -- stu_name을 v_stu_name에 넣는다.
    from student
    where stu_no=v_stu_no;
end test3;
/

variable d_stu_name varchar2(10);

execute test3(20153088, :d_stu_name);

print d_stu_name;