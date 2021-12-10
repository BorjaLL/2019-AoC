SET SERVEROUTPUT ON;

DECLARE
V_count NUMBER:=0;
V_mass varchar (4);
V_sat varchar (4);
V_orbits number;
V_debug number:=7500;
V_debug_id number:=100;

BEGIN
    dbms_output.put_line('Program started');
    select max(id) into V_orbits from orbits;
--    select V_debug_id into V_orbits from dual;
--    dbms_output.put_line(V_orbits);
    While V_orbits >=0 
--    and V_count < V_debug 
    loop
    select AAA into V_mass from orbits where id = V_orbits;
    select BBB into V_sat from orbits where id = V_orbits;
--    dbms_output.put_line('Planets left ='||V_orbits||' I_Mass '||V_mass||' I_Satelite '||v_sat); 
        while V_mass != 'COM' 
--            and V_count < V_debug 
            loop
            select BBB into V_SAT from orbits where bbb=V_mass;
            select AAA into V_MASS from orbits where bbb=V_mass;
--            dbms_output.put_line('Count = '||v_count||' New satelite '||v_sat||' - New mass '||V_mass);  
        
        v_count:= V_count +1;
        end loop;
    V_orbits := V_orbits -1;
    v_count:= V_count +1;
    
    end loop;
 

    dbms_output.put_line(V_count);
    dbms_output.put_line('Program completed');
END;
