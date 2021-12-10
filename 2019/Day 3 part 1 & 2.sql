DECLARE
    M1        NUMBER:=0;
    M2        NUMBER:=0;
    principio number;
    fin number;
    X_start number :=0;
    Y_start number :=0;    
    X1_origin Number:= 0;
    X1_target Number:= 0;
    Y1_origin Number:= 0;
    Y1_target Number:= 0;
    X2_origin Number:= 0;
    X2_target Number:= 0;
    Y2_origin Number:= 0;
    Y2_target Number:= 0;
    step varchar(10);
    GO NUMBER :=0;
    Distance number:=0;
    ANS number;
    ANS2 Number;

BEGIN
    dbms_output.put_line('Program started');
    select min("id") into principio from movements where "value1" is not null;
    select max("id") into fin from movements where "value1" is not null;
------------------------------------------------
--WIRE 1
for counter1 in principio..fin loop
    Select "value1" into step from movements where "id" = M1;
     dbms_output.put_line(step);
    if substr(step,1,1) = 'D' --DOWN
        then 
        Y1_target := Y1_origin-substr(step,2,6);
        for counter2 in Y1_target .. Y1_origin loop
        insert  INTO paths (id, x1, y1, distance )values (M1 ,X1_origin , Y1_origin, distance );
        Y1_origin:=Y1_origin-1;
        distance := distance +1;
        end loop;
        Y1_origin:=Y1_target;
        distance := distance -1;
    elsif substr(step,1,1) = 'U' --UP
        then 
        Y1_target := Y1_origin+substr(step,2,6);
        for counter2 in Y1_origin .. Y1_target loop
        insert  INTO paths (id, x1, y1, distance )values (M1 ,X1_origin , Y1_origin, distance );
        Y1_origin:=Y1_origin+1;
        distance := distance +1;
        end loop;
        Y1_origin:=Y1_target;
        distance := distance -1;
    elsif substr(step,1,1) = 'L' --LEFT
        then 
        X1_target := X1_origin-substr(step,2,6);
        for counter2 in X1_target .. X1_origin loop
        insert  INTO paths (id, x1, y1, distance )values (M1 ,X1_origin , Y1_origin, distance );
        X1_origin:=X1_origin-1;
        distance := distance +1;
        end loop;
        X1_origin:=X1_target;
        distance := distance -1;
    elsif substr(step,1,1) = 'R' --RIGHT
        then 
        X1_target := X1_origin+substr(step,2,6);
        for counter2 in X1_origin .. X1_target loop
        insert  INTO paths (id, x1, y1, distance )values (M1 ,X1_origin , Y1_origin, distance );
        X1_origin:=X1_origin+1;
        distance := distance +1;
        end loop;
        X1_origin:=X1_target;
        distance := distance -1;
    --*/
    else 
        dbms_output.put_line('Error');
    end if;
    
M1:=M1+1;
end loop;

-------------------------------------------------------------------
--WIRE 2
    select min("id") into principio from movements where "value2" is not null;
    select max("id") into fin from movements where "value2" is not null;
distance := 0;
for counter1 in principio..fin loop
    Select "value2" into step from movements where "id" = M2;
     dbms_output.put_line(step);
    if substr(step,1,1) = 'D' --DOWN
        then 
        Y2_target := Y2_origin-substr(step,2,6);
        for counter2 in Y2_target .. Y2_origin loop
        insert  INTO paths (id, x2, y2, distance )values (M2 ,X2_origin , Y2_origin,distance );
        Y2_origin:=Y2_origin-1;
        distance := distance +1;
        end loop;
        Y2_origin:=Y2_target;
        distance := distance -1;
    elsif substr(step,1,1) = 'U' --UP
        then 
        Y2_target := Y2_origin+substr(step,2,6);
        for counter2 in Y2_origin .. Y2_target loop
        insert  INTO paths (id, x2, y2, distance )values (M2 ,X2_origin , Y2_origin,distance );
        Y2_origin:=Y2_origin+1;
        distance := distance +1;
        end loop;
        Y2_origin:=Y2_target;
        distance := distance -1;
    elsif substr(step,1,1) = 'L' --LEFT
        then 
        X2_target := X2_origin-substr(step,2,6);
        for counter2 in X2_target .. X2_origin loop
        insert  INTO paths (id, x2, y2, distance )values (M2 ,X2_origin , Y2_origin,distance );
        X2_origin:=X2_origin-1;
        distance := distance +1;
        end loop;
        X2_origin:=X2_target;
        distance := distance -1;
    elsif substr(step,1,1) = 'R' --RIGHT
        then 
        X2_target := X2_origin+substr(step,2,6);
        for counter2 in X2_origin .. X2_target loop
        insert  INTO paths (id, x2, y2, distance )values (M2 ,X2_origin , Y2_origin,distance );
        X2_origin:=X2_origin+1;
        distance := distance +1;
        end loop;
        X2_origin:=X2_target;
        distance := distance -1;
    
    else 
        dbms_output.put_line('Error');
    end if;
    
M2:=M2+1;

end loop;
--Matches

update paths set fromorigin = (abs(X_start-x1)+abs(Y_start-y1)) where x2 is null;
update paths set fromorigin = (abs(X_start-x2)+abs(Y_start-y2)) where x1 is null;
update paths set fromorigin = 99999 where x2=X_start and y2=Y_start;
update paths set fromorigin = 99999 where x1=X_start and y1=Y_start;
SELECT min(p2.fromorigin) into ANS FROM PATHS p1 inner join paths p2 on p1.x1 =p2.x2 and p1.y1 = p2.y2;
update paths set distance = 99999 where x1=X_start and y1=Y_start;
update paths set distance = 99999 where x2=X_start and y2=Y_start;
SELECT min(p1.distance+p2.distance) into ans2 FROM PATHS p1 inner join paths p2 on p1.x1 =p2.x2 and p1.y1 = p2.y2;
--*/
commit;
    dbms_output.put_line(ANS);
    dbms_output.put_line(ANS2);
    dbms_output.put_line('Program completed');
END;
