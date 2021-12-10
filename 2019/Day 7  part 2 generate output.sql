SET SERVEROUTPUT ON;
declare
V_p  Number:=0;
V_p1  Number:=0;
V_p2  Number:=0;
V_p3  Number:=0;
V_p4  Number:=0;
V_p5  Number:=0;
V5  number:=0;
V6  number:=0;
V_dvalue number:=0;
V_node number:=0;
P number:=0;
V_mode   varchar (30);
V_MODE0   NUMBER:=5; 
V_MODE1   NUMBER:=5; 
V_MODE2   NUMBER:=5; 
V_MODE3   NUMBER:=5; 
V_MODE4   NUMBER:=5; 
V_V5      NUMBER:=0;  
p1  Number:=0;
p2  Number:=0;
t1  Number:=0;
t2  Number:=0;
t3  Number:=0;
step  Number:=0;
V_min number:=5;
V_max number :=9;
V_config varchar (32) :='0';
Begin

for node0 in 1 .. 5 LOOP 
    for node1 in 1 .. 5 LOOP  
        for node2 in 1 .. 5 LOOP         
            for node3 in 1 .. 5 LOOP  
                for node4 in 1 .. 5 LOOP 
                for node in 1..1 loop
                 if V_MODE0 = V_MODE1 or V_MODE0 = V_mode2 or V_MODE0 = V_mode3 or V_MODE0 = V_mode4 or V_MODE1 = V_mode2 or
                       V_MODE1 = V_mode3 or V_MODE1 = V_mode4 or V_MODE2 = V_mode3 or V_MODE2 = V_mode4 or V_MODE3 = V_mode4 then exit;
                       end if;
                    v_v5:=0;
                    v_p:=0;
                    --node 0
                    v6:=v_mode0; p:=0; p1 := p; p2 := p + 1; SELECT value1 INTO t3 FROM csv WHERE id = p2; UPDATE csv SET value1 = V6 WHERE id = t3;  V_p := p2 + 1; intcode1 (V_p,V_v5,V_dvalue); V_p1:=v_p;
            --        dbms_output.put_line('node 0 - position '||V_p||' output '||V_v5||' value '||V_dvalue);
                    --node 1
                    v6:=v_mode1; p:=0; p1 := p; p2 := p + 1; SELECT value2 INTO t3 FROM csv WHERE id = p2; UPDATE csv SET value2 = V6 WHERE id = t3; V_p := p2 + 1; intcode2 (V_p,V_v5,V_dvalue); V_p2:=v_p;
            --        dbms_output.put_line('node 1 - position '||V_p||' output '||V_v5||' value '||V_dvalue);
                    --node 2
                    v6:=v_mode2; p:=0; p1 := p; p2 := p + 1; SELECT value3 INTO t3 FROM csv WHERE id = p2; UPDATE csv SET value3 = V6 WHERE id = t3; V_p := p2 + 1; intcode3 (V_p,V_v5,V_dvalue); V_p3:=v_p;
            --        dbms_output.put_line('node 2 - position '||V_p||' output '||V_v5||' value '||V_dvalue);
                    --node 3
                    v6:=v_mode3; p:=0; p1 := p; p2 := p + 1; SELECT value4 INTO t3 FROM csv WHERE id = p2; UPDATE csv SET value4 = V6 WHERE id = t3; V_p := p2 + 1; intcode4 (V_p,V_v5,V_dvalue); V_p4:=v_p;
            --        dbms_output.put_line('node 3 - position '||V_p||' output '||V_v5||' value '||V_dvalue);
                    --node 4
                    v6:=v_mode4; p:=0; p1 := p; p2 := p + 1; SELECT value5 INTO t3 FROM csv WHERE id = p2; UPDATE csv SET value5 = V6 WHERE id = t3; V_p := p2 + 1; intcode5 (V_p,V_v5,V_dvalue); V_p5:=v_p;
            --        dbms_output.put_line('node 4 - position '||V_p||' output '||V_v5||' value '||V_dvalue);
                   
                    while v_dvalue !=9  loop
                    
                        v_p:=V_p1; intcode1 (V_p,V_v5,V_dvalue); V_p1:=v_p;  
                        v_p:=V_p2; intcode2 (V_p,V_v5,V_dvalue); V_p2:=v_p;   
                        v_p:=V_p3; intcode3 (V_p,V_v5,V_dvalue); V_p3:=v_p;   
                        v_p:=V_p4; intcode4 (V_p,V_v5,V_dvalue); V_p4:=v_p;    
                        v_p:=V_p5; intcode5 (V_p,V_v5,V_dvalue); V_p5:=v_p;
                    end loop;--*/
                    V_mode:= (V_MODE0||V_MODE1||V_MODE2||V_MODE3||V_MODE4);
                    dbms_output.put_line('config '||V_mode||' output '||V_v5||' value '||V_dvalue);   
                    insert into thrusters (config, output) values (V_MODE,V_v5) ; commit;
                    end loop;
                    V_MODE4:=V_MODE4+1;
                end loop;--v_mode4
                V_MODE4:=5;
                V_MODE3:=V_MODE3+1;
end loop;--v_mode3
V_MODE3:=5;
V_MODE2:=V_MODE2+1;
end loop;--v_mode2
V_MODE2:=5;
V_MODE1:=V_MODE1+1;
end loop;--v_mode1
V_MODE1:=5;
V_MODE0:=V_MODE0+1;
end loop;--v_mode0
        
update csv set value1 = oldvalue, value2 = oldvalue, value3 = oldvalue, value4 = oldvalue, value5 = oldvalue; commit;
end;