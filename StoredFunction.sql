create or replace function test6
(v_enr_grade in number)
return char     -- 함수를 실행한 후 반환값에 대한 자료형 선언

is
    enr_score char;
    
begin
    if v_enr_grade >= 90 then enr_score:='A';
    elsif v_enr_Grade >= 80 then enr_score:='B';
    elsif v_enr_Grade >= 70 then enr_score:='C';
    else enr_score:='F';
    end if;
    return (enr_score);
end test6;
/

variable d_score char;
execute :d_score:=test6(88); 
print d_score;

select enr_grade, test6(enr_grade)
from enrol
where stu_no = '20153075';