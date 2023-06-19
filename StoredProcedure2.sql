--사원번호, 사원이름, 사원직무, 상급자사원번호, 급여, 부서번호를 입력받아
--사원 테이블에 삽입하는 프로시저를 작성해라.
create or replace procedure prob1
(v_empno in emp.empno%type,
v_ename in emp.ename%type,
v_job in emp.job%type,
v_mgr in emp.mgr%type,
v_sal in emp.sal%type,
v_deptno in emp.deptno%type)
is
begin
    insert into emp(empno, ename, job, mgr, sal, deptno)
    values(v_empno, v_ename, v_job, v_mgr, v_sal, v_deptno);
    
commit;
end prob1;
/

execute prob1(0001, 'Mary', 'Free', 9999, 1800, 99);

select * from emp;

--부서번호를 변경하는 프로시저를 작성해라.
--(emp 테이블에서) - update~set~where
--(입력된 사원번호가 같을때 부서번호 변경해라)

create or replace procedure prob2
(v_empno in emp.empno%type,
v_deptno in emp.deptno%type)
is
begin
    update emp
    set deptno=v_deptno
    where empno=v_empno;
    
commit;
end prob2;
/

execute prob2(7839,99);