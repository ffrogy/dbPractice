-- 1. 20 또는 30인 부서번호만 사원(emp)테이블에서 복사하여 emp1테이블을 생성해라.
create table emp1 as
select *
from emp
where deptno = 20 or deptno = 30;

-- 2. dept 테이블을 복사하여 dept1테이블을 생성해라.
create table dept1 as
select *
from dept;​

-- 3. salgrade테이블을 복사하여 salgrade1테이블을 생성해라.
create table salgrade1 as
select *
from salgrade;

-- 4. 각각의 테이블을 확인한다.
select *
from emp1, dept1, salgrade1;

-- 5. 사원번호 7401, 사원이름 HOMER, 급여 1300, 부서번호 10인 사원이 오늘 입사하였다.
insert into emp(empno, ename, hiredate, sal, deptno) values(7401, 'HOMER', sysdate, 1300, 10);

-- 6. 사원번호 7323, 사원이름 BRANDA, 부서번호 30, 사원번호 7499와 동일한 급여를 받는 사원이 입사하였다. (부질의)
insert into emp(empno, ename, sal, deptno) values(7323, 'BRANDA', (select sal from emp where empno = 7499), 30);

-- 7. 사원(emp)테이블에서 부서번호가 10인 데이터를 emp1테이블에 삽입해라.
insert into emp1
select *
from emp
where deptno = 10;

-- 8. 사원번호 7369의 사원직무를 ANALYST로 바꾸어라.
update emp
set job = 'ANALYST'
where empno = 7369;

-- 9. 부서번호 20인 직원들의 급여를 10% 감하라.
select sal, sal*0.9 감소금액, deptno
from emp
where deptno=20;

-- 10. 모든 사원의 급여를 +100 증가시켜라
select ename, sal, sal+100 연상금액
from emp;