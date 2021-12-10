SET SERVEROUTPUT ON;

DECLARE
    p        NUMBER := 0;
    dvalue   NUMBER := 0;
    dvalue1   NUMBER := 0;
    p1       NUMBER := 0;
    p2       NUMBER := 0;
    p3       NUMBER := 0;
    p4       NUMBER := 0;
    v1       NUMBER:= 0;
    v2       NUMBER:= 0;
    v3       NUMBER:= 0;
    v4       NUMBER:= 0;
    v5       NUMBER:=0;
    v6       NUMBER:=0; 
    com      NUMBER:= 0;
    t1       NUMBER:= 0;
    t2       NUMBER:= 0;
    t3       NUMBER:= 0;
    output   VARCHAR (32000);
    x1       NUMBER:=0;
    x2       NUMBER:= 0;
    fin      NUMBER:= 0;
    l1       NUMBER:= 0;
    go       NUMBER:=0;
    mod1     NUMBER:= 0;
    mod2     NUMBER:= 0;
    V_mode   varchar (30);
    V_MODE0   NUMBER:=0; 
    V_MODE1   NUMBER:=0; 
    V_MODE2   NUMBER:=0; 
    V_MODE3   NUMBER:=0; 
    V_MODE4   NUMBER:=0; 
BEGIN
    dbms_output.put_line('Program started');
for node0 in 0 .. 4 LOOP 
    for node1 in 0 .. 4  LOOP 
        for node2 in 0 .. 4  LOOP--        
            for node3 in 0 .. 4  LOOP 
                for node4 in 0 .. 4  LOOP 
--                dbms_output.put_line(V_MODE0||V_MODE1||V_MODE2||V_MODE3||V_MODE4);
                    
                    for node in 0 .. 4 loop
                    if V_MODE0 = V_MODE1 or 
                       V_MODE0 = V_mode2 or
                       V_MODE0 = V_mode3 or
                       V_MODE0 = V_mode4 or
                       V_MODE1 = V_mode2 or
                       V_MODE1 = V_mode3 or
                       V_MODE1 = V_mode4 or
                       V_MODE2 = V_mode3 or
                       V_MODE2 = V_mode4 or
                       V_MODE3 = V_mode4 then exit;
                       end if;
--                    dbms_output.put_line(V_MODE0||V_MODE1||V_MODE2||V_MODE3||V_MODE4);
                        p:=0;
--                        select substr (v_mode,node,1)into V6 from dual; if the first position is 0 it returns the next one
                      if node =0 then select v_mode0 into v6 from dual;
                      elsif node = 1 then select v_mode1 into v6 from dual;
                      elsif node = 2 then select v_mode2 into v6 from dual;
                      elsif node = 3 then select v_mode3 into v6 from dual;
                      elsif node = 4 then select v_mode4 into v6 from dual;
                      end if;
                    
                        
                        SELECT MAX(id) INTO fin FROM csv;    
                        SELECT listagg(value, ',') INTO output FROM csv where id <=fin ; -- dbms_output.put_line(output);
                                p1 := p;
                                p2 := p + 1;
                                SELECT value INTO t3 FROM csv WHERE id = p2;
                                UPDATE csv SET value = V6 WHERE id = t3; 
                                p := p2 + 1;
--                                dbms_output.put_line(v6);
                    
                      
                        WHILE ( p < fin --and x1<100 
                        ) LOOP
                        
                            SELECT value INTO dvalue1 FROM csv  WHERE id = p;  --dbms_output.put_line('****decision value ='||dvalue1);
                            SELECT length(dvalue1) INTO l1 FROM dual;  --dbms_output.put_line('Length ='||L1);
                            Select substr(dvalue1,L1,1) into dvalue from dual; 
                            mod1:=0;
                            mod2:=0;
                            If L1 >2 then Select substr(dvalue1,L1-2,1) into mod1 from dual;   --dbms_output.put_line('mod1 ='||mod1);
                                IF L1>3 then Select substr(dvalue1,L1-3,1) into mod2 from dual;  --dbms_output.put_line('mod2 ='||mod2);
                                END IF;
                            END IF;
                            
                    
                            IF dvalue = 99 THEN --99 end
                                EXIT;  
--                                    dbms_output.put_line('found 99, END');
                               
                            ELSIF (dvalue = 1 or dvalue = 2)  THEN --sum 
                                p1 := p;
                                p2 := p + 1;
                                p3 := p + 2;
                                p4 := p + 3;
                                
                                if mod1 = 1 then 
                                    SELECT value INTO V1 FROM csv WHERE id = p2;
                                elsif mod1 = 0 then 
                                    SELECT value INTO t1 FROM csv WHERE id = p2; 
                                    SELECT value INTO v1 FROM csv WHERE id = t1;
                                end if; 
                                if mod2 = 1 then 
                                    SELECT value INTO V2 FROM csv WHERE id = p3;
                                elsif mod2 = 0 then 
                                    SELECT value INTO t2 FROM csv WHERE id = p3;
                                    SELECT value INTO v2 FROM csv WHERE id = t2;
                                end if;
                                SELECT value INTO t3 FROM csv WHERE id = p4;           
                                SELECT value INTO v3 FROM csv WHERE id = t3;
                    --            dbms_output.put_line('Positions ='||p1||' '||p2||' '||p3||' '||p4);
                                    if dvalue = 1 then v4 := v1 + v2;
                    --                dbms_output.put_line('Values ='||V1||' + '||V2||' = '||V4||' writing to '||T3);
                                 elsif dvalue = 2 then v4 := v1 * v2;
                    --             dbms_output.put_line('Values ='||V1||' * '||V2||' = '||V4||' writing to '||T3);
                                    end if;
                                UPDATE csv SET value = v4 WHERE id = t3;
                                
                                p := p4 + 1;
                    
                     ------------------------------------------------------------------------------------------------------------
                            ELSIF dvalue = 3 THEN
                                p1 := p;
                                p2 := p + 1;
                                SELECT value INTO t3 FROM csv WHERE id = p2;
                                UPDATE csv SET value = V5 WHERE id = t3; 
                                p := p2 + 1;
                    --            dbms_output.put_line('Positions ='||p1||' '||p2);
                    --            dbms_output.put_line('writing '||V5||' to '||t3);
                                
                            ELSIF dvalue = 4 THEN
                                p1 := p;
                                p2 := p + 1;
                                if mod1 = 1 then 
                                    SELECT value INTO V5 FROM csv WHERE id = p2;
                                elsif mod1 = 0 then 
                                    SELECT value INTO t1 FROM csv WHERE id = p2; 
                                    SELECT value INTO v5 FROM csv WHERE id = t1;
                                End if;
--                                dbms_output.put_line('code4 '||V5);
                    --            dbms_output.put_line('Positions ='||p1||' '||p2);
                    --            SELECT listagg(value, ',') INTO output FROM csv where id <P+5 and id >P-1; dbms_output.put_line('Values = '||output);
                                p := p2 + 1;
                            
                    ------------------part 2----------------------------------------------------------------------------------------
                             ELSIF dvalue = 5 THEN
                                p1 := p;
                                p2 := p + 1;
                                p3 := p + 2;
                                if mod1 = 1 then 
                                    SELECT value INTO V1 FROM csv WHERE id = p2;
                                elsif mod1 = 0 then 
                                    SELECT value INTO t1 FROM csv WHERE id = p2; 
                                    SELECT value INTO v1 FROM csv WHERE id = t1;
                                end if; 
                                if mod2 = 1 then 
                                    SELECT value INTO V2 FROM csv WHERE id = p3;
                                elsif mod2 = 0 then 
                                    SELECT value INTO t2 FROM csv WHERE id = p3;
                                    SELECT value INTO v2 FROM csv WHERE id = t2;
                                end if;
                                    IF V1 != 0 THEN 
                                        SELECT V2 INTO p FROM dual;
                                    ELSE p:=p3+1;
                                    END IF;
                    --                dbms_output.put_line('Positions ='||p1||' '||p2||' '||p3);
                    --                dbms_output.put_line('jump pointer T1 !=0 ->'||V1||' jump to '||V2||' '||p);
                            ELSIF dvalue = 6 THEN
                                p1 := p;
                                p2 := p + 1;
                                p3 := p + 2;
                                if mod1 = 1 then 
                                    SELECT value INTO V1 FROM csv WHERE id = p2;
                                elsif mod1 = 0 then 
                                    SELECT value INTO t1 FROM csv WHERE id = p2; 
                                    SELECT value INTO v1 FROM csv WHERE id = t1;
                                end if; 
                                if mod2 = 1 then 
                                    SELECT value INTO V2 FROM csv WHERE id = p3;
                                elsif mod2 = 0 then 
                                    SELECT value INTO t2 FROM csv WHERE id = p3;
                                    SELECT value INTO v2 FROM csv WHERE id = t2;
                                end if;    
                                IF V1 = 0 THEN 
                                        SELECT V2 INTO p FROM dual;
                                    ELSE p:=p3+1;
                                    END IF;
                    --            dbms_output.put_line('Positions ='||p1||' '||p2||' '||p3);
                    --                dbms_output.put_line('jump pointer T1 =0 ->'||V1||' '||V2||' '||T1||' '||p);
                            ELSIF (dvalue = 7 or dvalue = 8)  THEN --sum 
                                p1 := p;
                                p2 := p + 1;
                                p3 := p + 2;
                                p4 := p + 3;
                                
                                if mod1 = 1 then 
                                    SELECT value INTO V1 FROM csv WHERE id = p2;
                                elsif mod1 = 0 then 
                                    SELECT value INTO t1 FROM csv WHERE id = p2; 
                                    SELECT value INTO v1 FROM csv WHERE id = t1;
                                end if; 
                                if mod2 = 1 then 
                                    SELECT value INTO V2 FROM csv WHERE id = p3;
                                elsif mod2 = 0 then 
                                    SELECT value INTO t2 FROM csv WHERE id = p3;
                                    SELECT value INTO v2 FROM csv WHERE id = t2;
                                end if;
                                SELECT value INTO t3 FROM csv WHERE id = p4;           
                                SELECT value INTO v3 FROM csv WHERE id = t3;
                    --            dbms_output.put_line('Positions ='||p1||' '||p2||' '||p3||' '||p4);
                                    if dvalue = 7 then 
                                        if V1<V2 then v4 :=1;
                                        else v4:=0;
                                        end if;
                                    end if;
                    --                
                                     if dvalue = 8 then 
                                        if V1=V2 then v4 :=1;
                                        else v4:=0;
                                        end if;
                                    end if;
                    --             dbms_output.put_line('Values ='||V1||' * '||V2||' = '||V4||' '||T3);
                                    UPDATE csv SET value = v4 WHERE id = t3;
                    --                dbms_output.put_line('Positions ='||p1||' '||p2||' '||p3||' '||p4);
                    --                dbms_output.put_line('Values ='||dvalue||' '||V1||' vs '||V2||' '||V4||' '||T3);
                                    p := p4 + 1;
                                ELSE
--                                    dbms_output.put_line('decision value ='||dvalue1);
--                                    dbms_output.put_line('this wasnt a 1,2,3,4 or 99');
                                    p := p + 1;
                                    Exit;  
                             END IF;
                    
                    --   x1:=x1+1;
                       end loop;
--                        dbms_output.put_line('end state ='||v5);
                   
                    end loop; --*/
 rollback;     
 V_mode:= (V_MODE0||V_MODE1||V_MODE2||V_MODE3||V_MODE4);
-- dbms_output.put_line('Config '||V_MODE);
insert into thrusters (config, output) values (V_MODE,V5) ;    commit;
V5:=0;
V_MODE4:=V_MODE4+1;
end loop;--v_mode4
V_MODE4:=0;
V_MODE3:=V_MODE3+1;
end loop;--v_mode3
V_MODE3:=0;
V_MODE2:=V_MODE2+1;
end loop;--v_mode2
V_MODE2:=0;
V_MODE1:=V_MODE1+1;
end loop;--v_mode1
V_MODE1:=0;
V_MODE0:=V_MODE0+1;
end loop;--v_mode0
--select max(output) into v5 from thrusters; 
--select config into v6 from thursters where output =v5; dbms_output.put_line(v6);
--SELECT listagg(value, ',') INTO output FROM csv where id <=fin+20; dbms_output.put_line(output);
--SELECT listagg(value, ',') INTO output FROM csv where id =224; dbms_output.put_line(output);
    IF go = 1 THEN COMMIT;
    ELSE ROLLBACK; END IF;
    dbms_output.put_line('Program completed');
END;
