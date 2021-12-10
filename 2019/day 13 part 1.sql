SET SERVEROUTPUT ON;
declare
V_p  Number:=0;
V_p0  Number:=0;
V_X  Number:=0;
V_Y  Number:=0;
V_B  Number:=0;
V_dvalue number:=0;
V_V5      NUMBER:=2;  
V_RB number :=0; --relative base
V_count number :=0; 
V_GO number :=1;
V_Num number :=0;
V_debugID number:=0;
V_BASE1     VARCHAR2(3000);

Begin
dbms_output.put_line('Program Start');  
delete from t_debug;
delete from csv where oldvalue is null;
--update csv set value0 =oldvalue;
--update csv set value0 =2 where id =0;
for count in 0..130 loop
update hull set x1=x2;
end loop;
commit;

while v_dvalue !=99 loop
--X value
    intcode0 (V_p,V_v5,V_dvalue,v_RB, V_GO, V_debugID); 
    dbms_output.put_line('Position X '||V_p||' Output '||V_v5||' Optcode '||V_dvalue);  
    if v_dvalue = 99 then exit;end if;
    V_X:=V_V5;
--Y value
    intcode0 (V_p,V_v5,V_dvalue,v_RB, V_GO, V_debugID);
    dbms_output.put_line('Position Y '||V_p||' Output '||V_v5||' Optcode '||V_dvalue);  
    if v_dvalue = 99 then exit;end if;
    V_Y:=V_V5;    
--BLOCK value
    intcode0 (V_p,V_v5,V_dvalue,v_RB, V_GO, V_debugID);
    dbms_output.put_line('Position BLOCK '||V_p||' Output '||V_v5||' Optcode '||V_dvalue);  
    if v_dvalue = 99 then exit;end if;
    V_B:=V_V5;
    if V_X = -1 and V_Y = 0 then 
    dbms_output.put_line('Score ='|| V_B);  
    exit;
--    accept choice prompt ' (Y/N)?'; 
--    if '&choice' = 'Y' then             /* check the variable value */
--        dbms_output.put_line('Update data');
--    else
--        dbms_output.put_line('Exit'); exit;
    end if;
    
    select X1 into V_BASE1 from hull where id = V_Y; 
    if V_B = 0 then --empty
        update hull set x1 = (replacepos(V_BASE1,'.',V_X  ) )where id = V_Y;-- dbms_output.put_line('Paint '||(V_X-1)||' '||V_Y||' . '); 
--        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' . ') ;    commit;
    elsif V_B =1 then --wall
        update hull set x1 = (replacepos(V_BASE1,'#',V_X  ) )where id = V_Y; --V_Num:=V_Num+1; --dbms_output.put_line('Paint '||(V_X-1)||' '||V_Y||' # '||V_Num); 
--        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' # ') ;    commit;
    elsif V_B =2 then --BLOCK
        update hull set x1 = (replacepos(V_BASE1,'*',V_X  ) )where id = V_Y; V_Num:=V_Num+1; --dbms_output.put_line('Paint '||(V_X-1)||' '||V_Y||' * '||V_Num); 
--        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' * ') ;    commit;
    elsif V_B =3 then --Paddle
        update hull set x1 = (replacepos(V_BASE1,'-',V_X  ) )where id = V_Y; --V_Num:=V_Num+1; --dbms_output.put_line('Paint '||(V_X-1)||' '||V_Y||' - '||V_Num); 
--        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' - ') ;    commit;
    elsif V_B =4 then --Ball
        update hull set x1 = (replacepos(V_BASE1,'B',V_X  ) )where id = V_Y;-- V_Num:=V_Num+1; --dbms_output.put_line('Paint '||(V_X-1)||' '||V_Y||' B '||V_Num); 
--        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' B ') ;    commit;
    end if;

end loop;--*/
commit;
dbms_output.put_line('Number of Block Tiles ='|| V_NUM);  

dbms_output.put_line('Program END'); 
end;

