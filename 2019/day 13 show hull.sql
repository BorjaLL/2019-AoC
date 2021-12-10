create or replace procedure show_hull
is 
V_BASE1 VARCHAR2(32000);
begin
for V_count in 9..23 loop
if v_count <10 then
    select X1 into V_BASE1 from hull where id = V_count;
    dbms_output.put_line(V_count||'  '||V_BASE1); 
    else
    select X1 into V_BASE1 from hull where id = V_count;
    dbms_output.put_line(V_count||' '||V_BASE1); 
end if;
end loop;
end;