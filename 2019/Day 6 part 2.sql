SET SERVEROUTPUT ON;

DECLARE
V_count NUMBER:=0;
V_mass varchar (4):='YOU';
V_sat varchar (4);
V_orbits number;
V_debug number:=7500;
V_debug_id number:=100;

BEGIN
    dbms_output.put_line('Program started');
   -- truncate table jumps;
    select id into V_orbits from orbits where BBB='YOU';
dbms_output.put_line('YOU');
    While  V_mass != 'COM' 
   -- and V_count < V_debug 
    loop
    select AAA into V_mass from orbits where id = V_orbits;
    select BBB into V_sat from orbits where id = V_orbits;
--    dbms_output.put_line('Planet number ='||V_orbits); 
    select BBB into V_SAT from orbits where bbb=V_mass;
    select id into  V_orbits from orbits where bbb=V_mass;
    select AAA into V_MASS from orbits where bbb=V_mass;
    
    insert into jumps (id,aaa) values (V_count,V_sat);
--    dbms_output.put_line('Count = '||v_count||' New satelite '||v_sat||' - New mass '||V_mass);  
            
    v_count:= V_count +1;
    
    end loop;
   ---------------------------------------
    dbms_output.put_line('SANTA');
    v_count:= 0;
    v_mass:='SANT';
    select id into V_orbits from orbits where BBB='SAN';

    While  V_mass != 'COM' 
  --  and V_count < V_debug 
    loop
    select AAA into V_mass from orbits where id = V_orbits;
    select BBB into V_sat from orbits where id = V_orbits;
--    dbms_output.put_line('Planet number ='||V_orbits); 
    select BBB into V_SAT from orbits where bbb=V_mass;
    select id into  V_orbits from orbits where bbb=V_mass;
    select AAA into V_MASS from orbits where bbb=V_mass;
    
    insert into jumps (id,BBB) values (V_count,V_sat);
--    dbms_output.put_line('Count = '||v_count||' New satelite '||v_sat||' - New mass '||V_mass);  
            
    v_count:= V_count +1;
    
    end loop; --*/
 
--commit;
select min(a.id) into V_orbits from jumps a inner join jumps b on a.AAA=b.BBB;
select (a.id + b.id) into V_count from jumps a inner join jumps b on a.AAA=b.BBB
where a.id =V_orbits;
    dbms_output.put_line(V_count);
    dbms_output.put_line('Program completed');
rollback;

END;
