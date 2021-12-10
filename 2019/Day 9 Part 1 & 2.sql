SET SERVEROUTPUT ON;
declare
V_p  Number:=0;
V_p0  Number:=0;
V_p1  Number:=0;
V_p2  Number:=0;
V_p3  Number:=0;
V_p4  Number:=0;
V_dvalue number:=0;
V_V5      NUMBER:=2;  
V_RB number :=0; --relative base
V_GO number :=0;
V_debugID number:=0;
Begin
delete from t_debug;
delete from csv where oldvalue is null;
update csv set value0 =oldvalue;
commit;
while v_dvalue !=99 loop

    v_p:=V_p0; intcode0 (V_p,V_v5,V_dvalue,v_RB, V_GO, V_debugID); V_p0:=v_p;  
    dbms_output.put_line('Position '||V_p0||' Output '||V_v5||' Optcode '||V_dvalue);  
    
end loop;--*/

--dbms_output.put_line('config '||V_p||' output '||V_v5||' value '||V_dvalue);   
--insert into thrusters (config, output) values (V_p,V_v5) ; commit;

--update csv set value1 = oldvalue, value2 = oldvalue, value3 = oldvalue, value4 = oldvalue, value0 = oldvalue; commit;
end;