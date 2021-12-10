declare
V_p  Number:=0;
V_p0  Number:=0;
V_p1  Number:=0;
V_p2  Number:=0;
V_p3  Number:=0;
V_p4  Number:=0;
V_dvalue number:=0;
V_V5 NUMBER:=1;  
V_RB number :=0; --relative base
V_GO number :=0;
V_debugID number:=0;
V_X NUMBER:= (64+1);
V_Y NUMBER:= 64;
V_NUM NUMBER:= 0;
V_Check  VARCHAR2(300);
V_DIR VARCHAR2(300):='UP';
V_BASE1 VARCHAR2(3000);
V_TEST VARCHAR2(3000):='10001010011010';
V_PTEST NUMBER:= 1;

Begin
delete from t_debug;
delete from csv where oldvalue is null;
update csv set value0 =oldvalue;
select X1 into V_BASE1 from hull where id = V_Y; 
update hull set x1 = (replacepos(V_BASE1,'#',V_X  ) )where id = V_Y;
commit;
while v_dvalue !=99 loop
--if V_Num >200 then exit; end if;
    select substr(x1,V_X,1) into V_Check from hull where id = V_Y;
--    dbms_output.put_line('POSITION COLOUR  '||V_CHECK||' '||(V_X-1)||' '||V_Y); 
    if V_Check ='#' then 
        V_V5 :=1;
    elsif V_Check ='.' then 
        V_V5 :=0;
    else 
        dbms_output.put_line('ERROR EXIT '||(V_X-1)||','||V_Y); 
        exit; 
    end if;
--    select substr(V_TEST,V_ptest,1) into V_v5 from dual;V_ptest:=V_ptest+1;
    intcode0 (V_p,V_v5,V_dvalue,v_RB, V_GO, V_debugID);
--    dbms_output.put_line('Position '||V_p0||' Output1 '||V_v5||' Optcode '||V_dvalue);
    select X1 into V_BASE1 from hull where id = V_Y; 
    if v_V5 = 0 then --black
        update hull set x1 = (replacepos(V_BASE1,'.',V_X  ) )where id = V_Y; V_Num:=V_Num+1;-- dbms_output.put_line('Paint '||(V_X-1)||' '||V_Y||' . '); 
        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' . ') ;    commit;
    elsif v_V5 =1 then --white
        update hull set x1 = (replacepos(V_BASE1,'#',V_X  ) )where id = V_Y; V_Num:=V_Num+1; --dbms_output.put_line('Paint '||(V_X-1)||' '||V_Y||' # '||V_Num); 
        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' # ') ;    commit;
    end if;
--    select substr(V_TEST,V_ptest,1) into V_v5 from dual;V_ptest:=V_ptest+1;
    intcode0 (V_p,V_v5,V_dvalue,v_RB, V_GO, V_debugID);
--    dbms_output.put_line('Position '||V_p0||' Output2 '||V_v5||' Optcode '||V_dvalue);
    if v_V5 = 0 then --left
--        dbms_output.put_line('GOING LEFT '||V_DIR||' '||(V_X-1)||' '||V_Y); 
        if V_DIR ='UP' then V_DIR :='LEFT';
        elsif V_DIR ='DOWN' then V_DIR :='RIGHT';
        elsif V_DIR ='LEFT' then V_DIR :='DOWN';
        elsif V_DIR ='RIGHT' then V_DIR :='UP';
        end if;
    elsif v_V5 =1 then --right
--     dbms_output.put_line('GOING RIGHT '||V_DIR||' '||(V_X-1)||' '||V_Y); 
        if V_DIR ='UP' then V_DIR :='RIGHT';
        elsif V_DIR ='DOWN' then V_DIR :='LEFT';
        elsif V_DIR ='LEFT' then V_DIR :='UP';
        elsif V_DIR ='RIGHT' then V_DIR :='DOWN';
        end if;
    end if;
    if V_DIR ='UP' then V_Y :=V_Y -1;
        elsif V_DIR ='DOWN' then V_Y :=V_Y +1;
        elsif V_DIR ='LEFT' then V_X:=V_X-1;
        elsif V_DIR ='RIGHT' then V_X:=V_X+1;
    end if;
--        dbms_output.put_line('NEW POSITION '||(V_X-1)||' '||V_Y); 
    if V_X <1 then dbms_output.put_line('ERROR EXIT too much to the left '||(V_X-1)||','||V_Y);  exit;
        elsif V_X >129 then dbms_output.put_line('ERROR EXIT too much to the right '||(V_X-1)||','||V_Y);  exit;
        elsif V_Y <0 then dbms_output.put_line('ERROR EXIT too high '||(V_X-1)||','||V_Y);  exit;
        elsif V_Y >129 then dbms_output.put_line('ERROR EXIT too low '||(V_X-1)||','||V_Y);  exit;
    end if;


end loop;--*/

dbms_output.put_line('config '||V_p||' output '||V_v5||' value '||V_dvalue);   
--insert into thrusters (config, output) values (V_p,V_v5) ; commit;

update csv set value0 = oldvalue; commit;
end;
