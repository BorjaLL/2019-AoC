DECLARE
    M1        NUMBER:=134792;
    M2        NUMBER:=675810;
--    M1        NUMBER:=123456;
--    M2        NUMBER:=654321;
    
    ANS       NUMBER:=0;
    ANS2      NUMBER:=0;
    D1        NUMBER:=1;
    BAD       NUMBER:=0;
    Dubs      NUMBER:=0;
    Trips     NUMBER:=0;

BEGIN
    dbms_output.put_line('Program started');

for counter1 in m1..m2 loop
 ----------Ascending digit check
    dubs:=0;
    D1:=1;
    while D1<6 loop
        IF substr(counter1,D1+1,1)<substr(counter1,D1,1) then
--        dbms_output.put_line('KO '||counter1);
--        dbms_output.put_line(D1||D1+1);
--        dbms_output.put_line('Values '||substr(counter1,D1,1)||substr(counter1,D1+1,1));

            BAD:=1;
        end if;
    D1:=D1+1;    
    End loop;

----------Repeating digit check   
if bad =0 then
--        dbms_output.put_line('second test '||counter1);
    dubs:=0;
    trips:=0;
    D1:=1;
    while D1<6 loop
        IF substr(counter1,D1+1,1)=substr(counter1,D1,1) then
--        dbms_output.put_line(D1||D1+1);
--        dbms_output.put_line('Values '||substr(counter1,D1,1)||substr(counter1,D1+1,1));
            if substr(counter1,D1+2,1)=substr(counter1,D1,1) then
            trips:=trips+1;
--            dbms_output.put_line('TRIPS AFTER '||substr(counter1,D1,1)||substr(counter1,D1+1,1)||substr(counter1,D1+2,1));
            end if;
            if D1>1 then
                
            if substr(counter1,D1-1,1)=substr(counter1,D1,1) then
            trips:=trips+1;
--            dbms_output.put_line('TRIPS BEFORE '||substr(counter1,D1,1)||substr(counter1,D1+1,1)||substr(counter1,D1+2,1));
            end if;
            end if;
--            dbms_output.put_line('TRIPS value '||trips);
            if trips=0 then
            dubs:=dubs+1;
            else
            trips:=0;
            end if;
--            dbms_output.put_line('DUBS value '||dubs);
        end if;
    D1:=D1+1;    
    End loop;
end if;    
----------Answer

IF dubs=0 then BAD:=1;
end if;
--if bad=0 then
--dbms_output.put_line(dubs);
--end if;
if BAD = 0 then 
        ANS:=ANS+1;
dbms_output.put_line('OK '||counter1);
end if;
BAD:=0;
end loop;


commit;
    dbms_output.put_line(ANS);
    dbms_output.put_line(ANS2);
    dbms_output.put_line('Program completed');
END;
