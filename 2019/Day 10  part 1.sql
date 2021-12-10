declare
V_X  Number:=1;
V_Y NUMBER:=0;
V_1 NUMBER:=0;
V_BASE VARCHAR(300);
V_LEN Number:=0;
V_HI Number:=0;
V_count Number:=0;
V_Check  VARCHAR(300);
V_MAX Number :=0;
V_search Number :=0;
go Number :=1;
V_DEBUG VARCHAR (3000);

Begin
dbms_output.put_line('Program started');
select length(x5) into V_LEN from asteroids where id = V_Y;
select max(id) into V_HI from asteroids;


WHILE V_Y <= V_HI LOOP
select X5 into V_BASE from asteroids where id = V_Y; dbms_output.put_line(V_BASE);

    while V_X <= V_len loop
        select substr(x5,V_X,1) into V_BASE from asteroids where id = V_Y;
--        dbms_output.put_line(V_BASE);
            if V_BASE ='#' then 
                --left
                IF V_X>1 then
                    for jump in reverse 1 .. V_X-1 loop
                        select substr(x5,jump,1) into V_Check from asteroids where id = V_Y;
                            if V_Check ='#' then
                                V_count := V_count+1;
                                 V_DEBUG:=(V_X-1)||','||v_y||' '||(jump-1)||','||(V_Y); V_search :=V_search+1;
                                   if go=0 then       dbms_output.put_line('Search LEFT # '||V_Search||' '||V_DEBUG); end if;
                                exit;
                            end if;
                    end loop;
                END IF;   
                --right
                IF V_X < V_LEN THEN
                    for jump in V_X+1 .. V_LEN loop
                        select substr(x5,jump,1) into V_Check from asteroids where id = V_Y;
                            if V_Check ='#' then
                                V_count := V_count+1;
                                V_DEBUG:=(V_X-1)||','||v_y||' '||(jump-1)||','||(V_Y); V_search :=V_search+1;
                                   if go=0 then       dbms_output.put_line('Search RIGHT # '||V_Search||' '||V_DEBUG); end if;
                                exit;
                            end if;
                    end loop;
                END IF;
                --up
                IF V_Y >0 THEN 
                    for jump in REVERSE 0 .. V_Y-1 loop
                        select substr(x5,V_X,1) into V_Check from asteroids where id = JUMP;
                            if V_Check ='#' then
                                V_count := V_count+1;
                                V_DEBUG:=(V_X-1)||','||v_y||' '||(v_x-1)||','||(JUMP); V_search :=V_search+1;
                                   if go=0 then       dbms_output.put_line('Search UP # '||V_Search||' '||V_DEBUG); end if;
                                exit;
                            end if;
                    end loop;
                END IF;
                --down
                IF V_Y < V_HI THEN
                    for jump in V_Y+1 .. V_HI loop
                        select substr(x5,V_X,1) into V_Check from asteroids where id = JUMP;
                            if V_Check ='#' then
                                V_count := V_count+1;
                                V_DEBUG:=(V_X-1)||','||v_y||' '||(v_x-1)||','||(JUMP); V_search :=V_search+1;
                                   if go=0 then       dbms_output.put_line('Search DOWN # '||V_Search||' '||V_DEBUG); end if;
                                exit;
                            end if;
                    end loop;
                END IF;
                --Down right
                IF V_Y < V_HI and V_X < V_LEN THEN
                V_search :=0;
                V_1:=0;
                   for incrx in 1..(V_LEN-V_X) loop
                        for incry in 1..(V_HI-V_Y) loop
                            for mult in 1.. 10 loop
                                if V_X+(incrx*MULT) <= V_LEN and V_Y+(incry*MULT) <= V_HI then
                                    V_Check :='';
                                    if incrx=incry and V_1 = 0 then 
                                        select substr(x5,V_X+(incrx*MULT),1) into V_Check from asteroids where id = V_Y+(incry*MULT);
                                        V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X+(incrx*MULT)-1)||','||(V_Y+(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                                    if go=0 then    dbms_output.put_line('Search DR '||V_Search||' '||V_DEBUG); end if;
                                        if V_Check ='#' then V_1:=1; end if;                                               
                                    elsif incrx!=incry then
                                        if incry/2 = trunc (incry/2)  and incrx/2 = trunc (incrx/2) and mult =1 then exit;
                                        elsif incrx/3 = trunc (incrx/3)  and incry/3 = trunc (incry/3)  and mult =1 then exit;
                                        elsif incrx/5 = trunc (incrx/5)  and incry/5 = trunc (incry/5)  and mult =1 then exit;
                                        elsif incrx/7 = trunc (incrx/7)  and incry/7 = trunc (incry/7)  and mult =1 then exit;
                                        elsif incrx/13 = trunc (incrx/13)  and incry/13 = trunc (incry/13)  and mult =1 then exit;
                                        else
                                            select substr(x5,V_X+(incrx*MULT),1) into V_Check from asteroids where id = V_Y+(incry*MULT);
                                            V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X+(incrx*MULT)-1)||','||(V_Y+(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                                          if go=0 then    dbms_output.put_line('Search DR '||V_Search||' '||V_DEBUG); end if;
                                         end if;       
                                    end if;
                                  if V_Check ='#' then
                                     V_count := V_count+1;
                              if go=0 then        dbms_output.put_line('Found DR # '||V_DEBUG);end if;
                                     exit;
                                   end if;--*/ 
                                end if;
                            end loop;
                        end loop;
                    end loop;
                END IF;
                --Down Left
                IF V_Y < V_HI and V_X >1 THEN
                V_search :=0;
                V_1:=0;
                   for incrx in 1..(V_X-1) loop
                        for incry in 1..(V_HI-V_Y) loop
                            for mult in 1.. 10 loop
                                if V_X-(incrx*MULT) >0 and V_Y+(incry*MULT) <= V_HI then
                                    V_Check :='';
                                    if incrx=incry and V_1 = 0 then 
                                        select substr(x5,V_X-(incrx*MULT),1) into V_Check from asteroids where id = V_Y+(incry*MULT);
                                        V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X-(incrx*MULT)-1)||','||(V_Y+(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                                 if go=0 then         dbms_output.put_line('Search DL '||V_Search||' '||V_DEBUG); end if;
                                        if V_Check ='#' then V_1:=1; end if;                                               
                                    elsif incrx!=incry then
                                        if incry/2 = trunc (incry/2)  and incrx/2 = trunc (incrx/2) and mult =1 then exit;
                                        elsif incrx/3 = trunc (incrx/3)  and incry/3 = trunc (incry/3)  and mult =1 then exit;
                                        elsif incrx/5 = trunc (incrx/5)  and incry/5 = trunc (incry/5)  and mult =1 then exit;
                                        elsif incrx/7 = trunc (incrx/7)  and incry/7 = trunc (incry/7)  and mult =1 then exit;
                                        elsif incrx/13 = trunc (incrx/13)  and incry/13 = trunc (incry/13)  and mult =1 then exit;
                                        else
                                            select substr(x5,V_X-(incrx*MULT),1) into V_Check from asteroids where id = V_Y+(incry*MULT);
                                            V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X-(incrx*MULT)-1)||','||(V_Y+(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                                       if go=0 then       dbms_output.put_line('Search DL '||V_Search||' '||V_DEBUG); end if;
                                         end if;       
                                    end if;
                                  if V_Check ='#' then
                                     V_count := V_count+1;
                             if go=0 then          dbms_output.put_line('Found DL # '||V_DEBUG); end if;
                                     exit;
                                   end if;--*/ 
                                end if;
                            end loop;
                        end loop;
                    end loop;
                END IF;
                --UP Left
                IF V_Y >0 and V_X >1 THEN
                V_search :=0;
                V_1:=0;
                   for incrx in 1..(V_X-1) loop
                        for incry in 1 .. (V_Y) loop
                            for mult in 1.. 10 loop
                                if V_X-(incrx*MULT) >0 and V_Y-(incry*MULT) >= 0 then
                                    V_Check :='';
                                    if incrx=incry and V_1 = 0 then 
                                        select substr(x5,V_X-(incrx*MULT),1) into V_Check from asteroids where id = V_Y-(incry*MULT);
                                        V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X-(incrx*MULT)-1)||','||(V_Y-(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                                 if go=0 then         dbms_output.put_line('Search UL '||V_Search||' '||V_DEBUG); end if;
                                        if V_Check ='#' then V_1:=1; end if;                                               
                                    elsif incrx!=incry then
                                        if incry/2 = trunc (incry/2)  and incrx/2 = trunc (incrx/2) and mult =1 then exit;
                                        elsif incrx/3 = trunc (incrx/3)  and incry/3 = trunc (incry/3)  and mult =1 then exit;
                                        elsif incrx/5 = trunc (incrx/5)  and incry/5 = trunc (incry/5)  and mult =1 then exit;
                                        elsif incrx/7 = trunc (incrx/7)  and incry/7 = trunc (incry/7)  and mult =1 then exit;
                                        elsif incrx/13 = trunc (incrx/13)  and incry/13 = trunc (incry/13)  and mult =1 then exit;
                                        else 
                                            select substr(x5,V_X-(incrx*MULT),1) into V_Check from asteroids where id = V_Y-(incry*MULT);
                                            V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X-(incrx*MULT)-1)||','||(V_Y-(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                                       if go=0 then       dbms_output.put_line('Search UL '||V_Search||' '||V_DEBUG); end if;
                                         end if;       
                                    end if;
                                  if V_Check ='#' then
                                     V_count := V_count+1;
                                 if go=0 then      dbms_output.put_line('Found UL # '||V_DEBUG); end if;
                                     exit;
                                   end if;--*/ 
                                end if;
                            end loop;
                        end loop;
                    end loop;
                END IF;
                ---Up Right
                IF V_Y >0 and V_X < V_len THEN
                V_search :=0;
                V_1:=0;
                   for incrx in 1..(V_LEN - V_X) loop
                        for incry in 1 .. (V_Y) loop
                            for mult in 1.. 10 loop
                                if V_X+(incrx*MULT) >0 and V_Y-(incry*MULT) >= 0 then
                                    V_Check :='';
                                    if incrx=incry and V_1 = 0 then 
                                        select substr(x5,V_X+(incrx*MULT),1) into V_Check from asteroids where id = V_Y-(incry*MULT);
                                        V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X+(incrx*MULT)-1)||','||(V_Y-(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                                   if go=0 then       dbms_output.put_line('Search UR '||V_Search||' '||V_DEBUG); end if;
                                        if V_Check ='#' then V_1:=1; end if;                                               
                                    elsif incrx!=incry then
                                        if incry/2 = trunc (incry/2)  and incrx/2 = trunc (incrx/2) and mult =1 then exit;
                                        elsif incrx/3 = trunc (incrx/3)  and incry/3 = trunc (incry/3)  and mult =1 then exit;
                                        elsif incrx/5 = trunc (incrx/5)  and incry/5 = trunc (incry/5)  and mult =1 then exit;
                                        elsif incrx/7 = trunc (incrx/7)  and incry/7 = trunc (incry/7)  and mult =1 then exit;
                                        elsif incrx/13 = trunc (incrx/13)  and incry/13 = trunc (incry/13)  and mult =1 then exit;
                                        else
                                            select substr(x5,V_X+(incrx*MULT),1) into V_Check from asteroids where id = V_Y-(incry*MULT);
                                            V_DEBUG:=(V_X-1)||','||v_y||' '||(V_X+(incrx*MULT)-1)||','||(V_Y-(incry*MULT)||' incrx '||incrx||' incry '||incry||' mult '||mult); V_search :=V_search+1;
                                         if go=0 then     dbms_output.put_line('Search UR '||V_Search||' '||V_DEBUG); end if;
                                         end if;       
                                    end if;
                                  if V_Check ='#' then
                                     V_count := V_count+1;
                                  if go=0 then     dbms_output.put_line('Found UR # '||V_DEBUG); end if;
                                     exit;
                                   end if;--*/ 
                                end if;
                            end loop;
                        end loop;
                    end loop;
                END IF;

            ----------------------------------------------------    
            V_1:=0;
            V_X:=V_X-1;
            dbms_output.put_line('# '||V_X||','||V_Y||' V_COUNT= '||V_COUNT); 
            V_X:=V_X+1;
            if V_count > V_max then
                V_MAX := V_COUNT;
            end if;
            V_COUNT:=0;      
            end if;
        V_X:=V_X+1;
    end loop;--X
V_X:=1;    
V_Y:=V_Y+1;
END LOOP;--Y
dbms_output.put_line('V_MAX= '||V_max);
dbms_output.put_line('Program ended');
end;

