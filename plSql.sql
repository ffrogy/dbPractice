-- pl/sql : 오라클에서 제공하는 프로그래밍 언어 
-- declare, begin exception 

set serveroutput on;

--v_con 이라는 변수를 하나 만들어 1을 대입함

declare 
    v_con number:=1;
    
begin
    if v_con >1 then
        dbms_output.put_line('1초과');
    elsif v_con <1 then
        dbms_output.put_line('1미만');
    elsif v_con = 1 then
        dbms_output.put_line('일치');

    end if;
end;
/

DECLARE
    V_SCORE NUMBER:=87;
    
BEGIN
    CASE
        WHEN V_SCORE>=90 THEN DBMS_OUTPUT.PUT_LINE('A');
        WHEN V_SCORE>=80 THEN DBMS_OUTPUT.PUT_LINE('B');
    END CASE;
END;
/

--기본 LOOP
DECLARE 
    V_CNT NUMBER:=0;
    V_SUM NUMBER:=0;
    
BEGIN
    LOOP
        V_CNT:=V_CNT+1;
        V_SUM:=V_SUM+V_CNT;
        DBMS_OUTPUT.PUT_LINE(V_SUM);
        EXIT WHEN V_CNT=10;
    END LOOP;
END;
/
        
--WHILE LOOP으로 변경
DECLARE 
    V_CNT NUMBER:=0;
    V_SUM NUMBER:=0;
BEGIN
    WHILE V_CNT < 10
        LOOP
            V_CNT:=V_CNT+1;
            V_SUM:=V_SUM+V_CNT;
            DBMS_OUTPUT.PUT_LINE(V_SUM);
        END LOOP;
END;
/    
    
--FOR LOOP
declare
    v_sum number := 0;
begin
    for i in 0..10 loop
        v_sum := v_sum + i;
    end loop;
    dbms_output.put_line(v_sum);
end;
/
    
DECLARE
    V_CNT NUMBER := 0;
    V_SUM NUMBER := 0;
    
BEGIN
    FOR I IN 0..10 
        LOOP      
        V_SUM := V_SUM + I;
        DBMS_OUTPUT.PUT_LINE(V_SUM);
        END LOOP;
END;
/    
    
begin
    for i in 1..9 loop
    continue when mod(i, 2) = 0;
    dbms_output.put_line('현재 i의 값 : ' || i);
    end loop;
end;
/
    
DECLARE 
    V_NUM NUMBER := 0;
    
BEGIN 
    FOR I IN 0..4
        LOOP
        V_NUM := 2 * I + 1;
        DBMS_OUTPUT.PUT_LINE(V_NUM);
        END LOOP;

END;
/   