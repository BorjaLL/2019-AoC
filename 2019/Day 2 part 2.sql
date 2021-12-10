SET SERVEROUTPUT ON;

DECLARE
    p        NUMBER := 0;
    dvalue   NUMBER :=0;
    p1       NUMBER;
    p2       NUMBER;
    p3       NUMBER;
    p4       NUMBER;
    v1       NUMBER;
    v2       NUMBER;
    V3       NUMBER;
    v4       NUMBER;
    Com      Number:=0;
    T1       NUMBER;
    T2       NUMBER;
    T3       NUMBER;
    output varchar (32000);
    X1 Number;
    X2 Number;
BEGIN
    dbms_output.put_line('Program started');
    dbms_output.put_line('Initial state:');
For X1 in 0 .. 99 loop
    for X2 in 0 .. 10 loop
    update csv set "value" = x1 where "id" = 1;
    update csv set "value" = x2 where "id" = 2;       
          p:= 0;                      
                  select listagg ("value",',') into output from csv;
--                                    dbms_output.put_line(output);
                                    WHILE ( p < 157) LOOP
                                        SELECT "value" INTO dvalue FROM csv WHERE "id" = p;
--                                        dbms_output.put_line('decision value ='||dvalue);
                                       if V4 = 19690720 then 
                                            dbms_output.put_line(output);
                                       Exit;
                                       end if;
                                        IF dvalue = 99 then --99 end
                                             EXIT;
--                                        dbms_output.put_line('dvalue'||dvalue);
--                                        dbms_output.put_line('found 99, going to the next value');
                                        
                                        ELSIF dvalue = 1 THEN --sum
                                            p1 := p;
                                            p2 := p + 1;
                                            p3 := p + 2;
                                            p4 := p + 3;
--                                            dbms_output.put_line('SUM dvalue ='||dvalue);
--                                            dbms_output.put_line('Positions ='||p1||' '||p2||' '||p3||' '||p4);
                                            select "value" into T1 from csv where "id" = p2;
                                            select "value" into T2 from csv where "id" = p3;
                                            select "value" into T3 from csv where "id" = p4;
                                
                                            select "value" into V1 from csv where "id" = T1;
                                            select "value" into V2 from csv where "id" = T2;
                                            select "value" into V3 from csv where "id" = T3;
                                           
                                           
                                            V4 := V1+V2;
                                            Update csv set "value" = v4 where "id" = T3;
--                                            dbms_output.put_line('-----------------------------');
--                                            dbms_output.put_line('Target 1 ='||t1||' '||'Value 1 =' || v1);
--                                            dbms_output.put_line('Target 2 ='||t2||' '||'Value 2 =' || v2);            
--                                            dbms_output.put_line('Target 3 ='||t3||' '||'Value 3 =' || T3);
--                                            dbms_output.put_line('-----------------------------');
                                
--                                            dbms_output.put_line('Result of Sum v4 ='||v4||' going into position '||T3);
                                            p := p4 + 1;
                                        ----------------------------------------------------------------------------------------------------------
                                         ELSIF dvalue = 2 THEN --multiply
                                            p1 := p;
                                            p2 := p + 1;
                                            p3 := p + 2;
                                            p4 := p + 3;
--                                            dbms_output.put_line('MUL dvalue ='||dvalue);
--                                            dbms_output.put_line('Positions ='||p1||' '||p2||' '||p3||' '||p4);
                                            select "value" into T1 from csv where "id" = p2;
                                            select "value" into T2 from csv where "id" = p3;
                                            select "value" into T3 from csv where "id" = p4;
                                
                                            select "value" into V1 from csv where "id" = T1;
                                            select "value" into V2 from csv where "id" = T2;
                                            select "value" into V3 from csv where "id" = T3;
                                           
                                           
                                            V4 := V1*V2;
                                             Update csv set "value" = v4 where "id" = T3;
--                                            dbms_output.put_line('-----------------------------');
--                                            dbms_output.put_line('Target 1 ='||t1||' '||'Value 1 =' || v1);
--                                            dbms_output.put_line('Target 2 ='||t2||' '||'Value 2 =' || v2);            
--                                            dbms_output.put_line('Target 3 ='||t3||' '||'Value 3 =' || T3);
--                                            dbms_output.put_line('-----------------------------');
                                
--                                            dbms_output.put_line('Result of Multiply v4 ='||v4||' going into position '||T3);
                                            p := p4 + 1;
                                            ------------------------------------------------------------------------------------------------------------
                                        ELSE
--                                            dbms_output.put_line('this wasnt a 1,2 or 99');
                                            p:= p+1;
                                        END IF;
                                
                                
--                                        dbms_output.put_line('Next position p ='||p);
                                select listagg ("value",',') into output from csv;
--                                dbms_output.put_line(output);
                                    END LOOP;

rollback;
   End loop;
   End loop;
    dbms_output.put_line('Program completed');
END;
/