SET SERVEROUTPUT ON;
declare
V_X  Number:= 31;--12;  --31;
V_Y NUMBER:=34; --13;  --34;
V_1 NUMBER:=0;
V_BASE VARCHAR(300);
V_BASE1 VARCHAR2 (32767);
V_LEN Number:=0;
V_HI Number:=0;
V_count Number:=0;
V_Check  VARCHAR(300);
V_MAX Number :=0;
V_search Number :=0;
go Number :=1;
V_DEBUG VARCHAR (3000);
V_Num   number:=0;
V_XT    number:=0;
V_YT    number:=0;
V_ANG   number:=0;
incrx   number:=0;
incry   number:=0;


Begin
dbms_output.put_line('Program started');
select length(x5) into V_LEN from asteroids where id = V_Y;
select max(id) into V_HI from asteroids;
update asteroids set x5 = x1;
delete from angles;commit;
while v_num <299 loop
    --UP 
    for jump in REVERSE 0 .. V_Y-1 loop
        select substr(x5,V_X,1) into V_Check from asteroids where id = JUMP;
            if V_Check ='#' then
                V_count := V_count+1;
                select X5 into V_BASE1 from asteroids where id = jump; 
                update asteroids set x5 = (replacepos(V_BASE1,'.',V_X  ) )where id = jump; V_Num:=V_Num+1; 
                dbms_output.put_line('Blown UP '||(V_X-1)||','||jump||' Jump '||V_Num);
                V_DEBUG:=(V_X-1)||','||v_y||' '||(v_x-1)||','||(JUMP); V_search :=V_search+1; 
                   if go=0 then dbms_output.put_line('Search UP # '||V_Search||' '||V_DEBUG); end if;
                exit;
            end if;
    end loop;
    --UP RIGHT
    for incrx in V_X+1..V_LEN loop
         for incry in reverse 0 .. (V_Y-1) loop
--            dbms_output.put_line((incrx-1)||' '||incry||' '||((atan2((V_X-incrx),(V_Y-incry))*180/acos(-1))));
            insert into angles (x,y,ang) values ((incrx-1),incry,((atan2((V_X-incrx),(V_Y-incry))*180/acos(-1))));
         END LOOP;
    END LOOP;
         ANG_RANK ( V_X,V_Y );
    select max(id) into V_ANG from angles;
    for counter in 1 .. V_ANG loop
    select abs(x-(V_x-1)) into incrx from angles where id = counter;
    select abs(y-V_Y) into incry from angles where id = counter;
        for mult in 1.. 10 loop
            V_Check :='';
            if V_X+(incrx*MULT) >0 and V_Y-(incry*MULT) >= 0 then
                    select substr(x5,V_X+(incrx*MULT),1) into V_Check from asteroids where id = V_Y-(incry*MULT);
                        V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X+(incrx*MULT)-1)||','||(V_Y-(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                     if go=0 then     dbms_output.put_line('Search UR '||V_Search||' '||V_DEBUG); end if;
            end if;         
            if V_Check ='#' then
                 V_count := V_count+1;
                 select X5 into V_BASE1 from asteroids where id =  V_Y-(incry*MULT); 
                 update asteroids set x5 =replacepos(V_BASE1,'.',V_X+(incrx*MULT)  ) where id = V_Y-(incry*MULT); V_Num:=V_Num+1; dbms_output.put_line('Blown UR '||(V_X+(incrx*MULT)-1)||','||(V_Y-(incry*MULT))||' Jump '||V_Num);
                if go=0 then     dbms_output.put_line('Found UR # '||V_DEBUG); end if;
                exit;
            end if; 
        end loop;
    End loop;
    --right
    for jump in V_X+1 .. V_LEN loop
        select substr(x5,jump,1) into V_Check from asteroids where id = V_Y;
            if V_Check ='#' then
                V_count := V_count+1;
                V_DEBUG:=(V_X-1)||','||v_y||' '||(jump-1)||','||(V_Y); V_search :=V_search+1;
                select X5 into V_BASE1 from asteroids where id = V_Y; 
                update asteroids set x5 =replacepos(V_BASE1,'.',jump  ) where id = V_Y; V_Num:=V_Num+1; dbms_output.put_line('Blown RIGHT '||(jump-1)||','||V_Y||' Jump '||V_Num);
                   if go=0 then       dbms_output.put_line('Search RIGHT # '||V_Search||' '||V_DEBUG); end if;
                exit;
            end if;
    end loop;
    --DOWN RIGHT
    delete from angles;commit;
    for incrx in V_X+1..V_LEN loop
         for incry in V_Y+1 .. V_HI loop
    --        dbms_output.put_line((incrx-1)||' '||incry||' '||((atan2((V_X-incrx),(V_Y-incry))*180/acos(-1))));
            insert into angles (x,y,ang) values ((incrx-1),incry,((atan2((V_X-incrx),(V_Y-incry))*180/acos(-1))));
         END LOOP;
    END LOOP;
         ANG_RANK ( V_X,V_Y );
    select max(id) into V_ANG from angles;
    for counter in 1 .. V_ANG loop
        select abs(x-(V_x-1)) into incrx from angles where id = counter;
        select abs(y-V_Y) into incry from angles where id = counter;
        for mult in 1.. 10 loop
            V_Check :='';
            if V_X+(incrx*MULT) <= V_LEN and V_Y+(incry*MULT) <= V_HI then
                select substr(x5,V_X+(incrx*MULT),1) into V_Check from asteroids where id = V_Y+(incry*MULT);
                V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X+(incrx*MULT)-1)||','||(V_Y+(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                if go=0 then    dbms_output.put_line('Search DR '||V_Search||' '||V_DEBUG); end if;
            end if;                                   
            if V_Check ='#' then
             V_count := V_count+1;
             select X5 into V_BASE1 from asteroids where id = V_Y+(incry*MULT); 
             update asteroids set x5 =replacepos(V_BASE1,'.',(V_X+(incrx*MULT)))   where id = V_Y+(incry*MULT); V_Num:=V_Num+1; dbms_output.put_line('Blown DR '||(V_X+(incrx*MULT)-1)||','||(V_Y+(incry*MULT))||' Jump '||V_Num);       
            if go=0 then        dbms_output.put_line('Found DR # '||V_DEBUG);end if;
             exit;
            end if; 
        end loop;
    end loop;
    --down
    for jump in V_Y+1 .. V_HI loop
        select substr(x5,V_X,1) into V_Check from asteroids where id = JUMP;
            if V_Check ='#' then
                V_count := V_count+1;
                V_DEBUG:=(V_X-1)||','||v_y||' '||(v_x-1)||','||(JUMP); V_search :=V_search+1;
                select X5 into V_BASE1 from asteroids where id = jump; 
                update asteroids set x5 =replacepos(V_BASE1,'.',V_X)   where id = jump; V_Num:=V_Num+1; dbms_output.put_line('Blown DOWN '||(V_X-1)||','||jump||' Jump '||V_Num);
                   if go=0 then       dbms_output.put_line('Search DOWN # '||V_Search||' '||V_DEBUG); end if;
                exit;
            end if;
    end loop;
    --DOWN LEFT
    delete from angles;commit;
    for incrx in reverse 0 .. V_X-1 loop
         for incry in V_Y+1 .. V_HI loop
    --        dbms_output.put_line((incrx-1)||' '||incry||' '||((atan2((V_X-incrx),(V_Y-incry))*180/acos(-1))));
            insert into angles (x,y,ang) values ((incrx-1),incry,((atan2((V_X-incrx),(V_Y-incry))*180/acos(-1))));
         END LOOP;
    END LOOP;
         ANG_RANK ( V_X,V_Y );
    select max(id) into V_ANG from angles;
    for counter in 1 .. V_ANG loop
        select abs(x-(V_x-1)) into incrx from angles where id = counter;
        select abs(y-V_Y) into incry from angles where id = counter;
        for mult in 1.. 10 loop
             V_Check :='';
             if V_X-(incrx*MULT) >0 and V_Y+(incry*MULT) <= V_HI then
                select substr(x5,V_X-(incrx*MULT),1) into V_Check from asteroids where id = V_Y+(incry*MULT);
                V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X-(incrx*MULT)-1)||','||(V_Y+(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                if go=0 then       dbms_output.put_line('Search DL '||V_Search||' '||V_DEBUG); end if;                   
                if V_Check ='#' then
                    V_count := V_count+1;
                    select X5 into V_BASE1 from asteroids where id = (V_Y+(incry*MULT)); 
                    update asteroids set x5 =replacepos(V_BASE1,'.',V_X-(incrx*MULT))   where id = V_Y+(incry*MULT); V_Num:=V_Num+1; dbms_output.put_line('Blown DL '||(V_X-(incrx*MULT)-1)||','||(V_Y+(incry*MULT))||' Jump '||V_Num);
                    if go=0 then          dbms_output.put_line('Found DL # '||V_DEBUG); end if;
                    exit;
                end if;
            end if;
        end loop;
    end loop;
    --LEFT
    for jump in reverse 1 .. V_X-1 loop
        select substr(x5,jump,1) into V_Check from asteroids where id = V_Y;
            if V_Check ='#' then
                V_count := V_count+1;
                 V_DEBUG:=(V_X-1)||','||v_y||' '||(jump-1)||','||(V_Y); V_search :=V_search+1;
                  select X5 into V_BASE1 from asteroids where id = V_Y; 
                  update asteroids set x5 =replacepos(V_BASE1,'.',jump)  where id = V_Y; V_Num:=V_Num+1; dbms_output.put_line('Blown LEFT '||(jump-1)||','||V_Y||' Jump '||V_Num);
                   if go=0 then       dbms_output.put_line('Search LEFT # '||V_Search||' '||V_DEBUG); end if;
                exit;
            end if;
    end loop;
    --UP LEFT
    delete from angles;commit;
    for incrx in reverse 0 .. V_X-1 loop
         for incry in reverse 0 .. V_Y-1  loop
    --        dbms_output.put_line((incrx-1)||' '||incry||' '||((atan2((V_X-incrx),(V_Y-incry))*180/acos(-1))));
            insert into angles (x,y,ang) values ((incrx-1),incry,((atan2((V_X-incrx),(V_Y-incry))*180/acos(-1))));
         END LOOP;
    END LOOP;
         ANG_RANK ( V_X,V_Y );
    select max(id) into V_ANG from angles;
    for counter in 1 .. V_ANG loop
        select abs(x-(V_x-1)) into incrx from angles where id = counter;
        select abs(y-V_Y) into incry from angles where id = counter;
        for mult in 1.. 10 loop
             V_Check :='';
             if V_X-(incrx*MULT) >0 and V_Y-(incry*MULT) >= 0 then
                select substr(x5,V_X-(incrx*MULT),1) into V_Check from asteroids where id = V_Y-(incry*MULT);
                V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X-(incrx*MULT)-1)||','||(V_Y-(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                
                if go=0 then       dbms_output.put_line('Search UL '||V_Search||' '||V_DEBUG); end if;       
                if V_Check ='#' then
                     V_count := V_count+1;
                     select X5 into V_BASE1 from asteroids where id = V_Y-(incry*MULT); 
                     update asteroids set x5 =replacepos(V_BASE1,'.',V_X-(incrx*MULT))   where id = V_Y-(incry*MULT); V_Num:=V_Num+1; dbms_output.put_line('Blown UL '||(V_X-(incrx*MULT)-1)||','||(V_Y-(incry*MULT))||' Jump '||V_Num);
                     if go=0 then      dbms_output.put_line('Found UL # '||V_DEBUG); end if;
                     exit;
                end if;
            end if;
        end loop;
    end loop;
end loop;--*/
update asteroids set x5 = x1;
commit;
dbms_output.put_line('Program ended');
end;
--look for point 199