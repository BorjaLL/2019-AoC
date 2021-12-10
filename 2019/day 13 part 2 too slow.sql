SET SERVEROUTPUT ON;
declare
V_p  Number:=0;
V_p0  Number:=0;
V_X  Number:=0;
V_Y  Number:=0;
V_B  Number:=0;
V_dvalue number:=0;
V_V5  NUMBER:=0;  
--V_MOVE  NUMBER:=-1;  
V_MOVE  NUMBER:=0;  
--V_MOVE  NUMBER:=1;  
V_RB number :=0; --relative base
V_count number :=0; 
V_GO number :=1;
V_Num number :=0;
V_debugID number:=0;
V_BASE1 VARCHAR2(3000);
V_BEGIN number:=0;
V_PX number:=0;
V_BX number:=0;
V_BX_prev number:=0;
V_BY number:=0;
V_BY_prev number:=0;
V_BX_EXP number:=0;
V_DIRX varchar2(300);
V_DIRY varchar2(300);
V_SCORE number:=0;

Begin
dbms_output.put_line('Program Start');  
--delete from t_debug;
if V_BEGIN = 1 then 
    delete from csv where oldvalue is null;
    update csv set value0 =oldvalue;
    update csv set value0 =2 where id =0;
commit;

elsif V_BEGIN =0 then  
    select x3 into V_P from hull where id =0;
    select x3 into v_RB from hull where id =1;
    select x3 into v_PX from hull where id =2;
    select x3 into v_BX from hull where id =3;
    select x3 into v_BY from hull where id =4;
    select x3 into V_BX_prev from hull where id =5;
    select x3 into V_BY_prev from hull where id =6;
--    select max(id) into V_COUNT from movingball;
--    V_COUNT:=V_COUNT+1;
end if;
while v_dvalue !=99 loop
    select x3 into V_SCORE from hull where id=7;
    IF V_BY_PREV < V_BY then V_DIRY:='DOWN';
    ELSIF V_BY_PREV > V_BY then V_DIRY:='UP';
    END IF;
    
    IF V_BX_PREV < V_BX then V_DIRX:='RIGHT';
    ELSIF V_BX_PREV > V_BX then V_DIRX:='LEFT';
    END IF;
    If V_BY <12 then 
        if V_DIRX ='LEFT' then V_BX_EXP:=(V_BX-(1));
        elsif V_DIRX ='RIGHT' then V_BX_EXP:=(V_BX+(1));
        end if;
    else 
        if V_DIRX ='LEFT' then V_BX_EXP:=(V_BX-(1*(22-V_BY)));
        elsif V_DIRX ='RIGHT' then V_BX_EXP:=(V_BX+(1*(22-V_BY)));
        else V_BX_EXP:=24;
        end if;
    end if;
    
    if V_BX_EXP <0 then V_BX_EXP:=1;
    elsif V_BX_EXP >40 then V_BX_EXP:=38; 
    end if;
    
    if V_BX_EXP > V_PX then V_MOVE:= 1;
    elsif V_BX_EXP < V_PX then V_MOVE:= -1;
    elsif V_BX_EXP = V_PX then V_MOVE:= 0;
    end if;
    if V_BY = 21 and V_DIRX ='RIGHT' and V_PX-1=V_BX then V_MOVE:= -1;
    elsif V_BY = 21 and V_DIRX ='LEFT' and V_PX+1=V_BX then V_MOVE:= 1;

    end if;



    V_V5:=V_MOVE;
--    V_V5:= -1;
--X value
    intcode0 (V_p,V_v5,V_dvalue,v_RB, V_GO, V_debugID); --    dbms_output.put_line('Position X '||V_p||' Output '||V_v5||' Optcode '||V_dvalue);  
    if v_dvalue = 99 then exit;end if;V_X:=V_V5;
--Y value
    intcode0 (V_p,V_v5,V_dvalue,v_RB, V_GO, V_debugID);--    dbms_output.put_line('Position Y '||V_p||' Output '||V_v5||' Optcode '||V_dvalue);  
    if v_dvalue = 99 then exit;end if;V_Y:=V_V5;    
--BLOCK value
    intcode0 (V_p,V_v5,V_dvalue,v_RB, V_GO, V_debugID);--    dbms_output.put_line('Position BLOCK '||V_p||' Output '||V_v5||' Optcode '||V_dvalue);  
    if v_dvalue = 99 then exit;end if;V_B:=V_V5;
    if V_X = -1 and V_Y = 0 then dbms_output.put_line('Score ='|| V_B); 
    if V_B >0 then update hull set x3 = V_B where id =8; end if;
    if V_B>V_SCORE and V_B > 500 then 
        update hull set x3 = V_B where id =7; 
--        update hull set x4 = x1;
--        update hull set x5 = x3;
       -- update csv set value3=value0;
       -- show_hull;
    end if;
--    if V_B > 500 then exit; end if;
    end if;
    select X1 into V_BASE1 from hull where id = V_Y; 
    if V_B = 0 then --empty
        update hull set x1 = (replacepos(V_BASE1,'.',V_X  ) )where id = V_Y; --dbms_output.put_line('Paint '||(V_X)||' '||V_Y||' . '); 
--        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' . ') ;    commit;
    elsif V_B =1 then --wall
        update hull set x1 = (replacepos(V_BASE1,'#',V_X  ) )where id = V_Y; --dbms_output.put_line('Paint '||(V_X)||' '||V_Y||' # '); 
--        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' # ') ;    commit;
    elsif V_B =2 then --BLOCK
        update hull set x1 = (replacepos(V_BASE1,'*',V_X  ) )where id = V_Y; --dbms_output.put_line('Paint '||(V_X)||' '||V_Y||' * '); 
--        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' * ') ;    commit;
    elsif V_B =3 then --Paddle
        update hull set x1 = (replacepos(V_BASE1,'-',V_X  ) )where id = V_Y; --dbms_output.put_line('Paint '||(V_X)||' '||V_Y||' - '); 
--        dbms_output.put_line('PADDLE POSITION = '||V_X||' , '||V_Y);
        update hull set x3 = V_X where id =2;
        V_PX:=V_X;
    elsif V_B =4 then --Ball
    
        update hull set x1 = (replacepos(V_BASE1,'@',V_X  ) )where id = V_Y;-- V_Num:=V_Num+1; --dbms_output.put_line('Paint '||(V_X-1)||' '||V_Y||' @ '||V_Num); 
--        dbms_output.put_line('BALL POSITION = '||V_X||' , '||V_Y); 
        update hull set x3 = (select x3 from hull where id =3) where id =5;
        update hull set x3 = (select x3 from hull where id =4) where id =6;
        update hull set x3 = V_X where id =3;
        select x3 into  V_BX_PREV from hull  where id =5;
        select x3 into  V_BY_PREV from hull  where id =6;
        V_BX:=V_X;
        update hull set x3 = V_Y where id =4;
        V_BY:=V_Y;
        insert into movingball (id, V_BX, V_BY, V_PX,V_BX_PREV, V_BY_PREV,V_DIRX, V_MOVE) values ((V_SCORE+V_COUNT),V_BX, V_BY, V_PX,V_BX_PREV, V_BY_PREV,V_DIRX, V_MOVE);commit;
        V_COUNT:=V_COUNT+1;
       -- if V_SCORE+V_COUNT> 5000 then exit; end if;
        dbms_output.put_line('Expected BALL POSITIONX = '||V_BX_EXP||' Current PADDLE POSITIONX '|| V_PX ||' MOVE '||V_MOVE||' BALL Direction '||V_DIRY||V_DIRX); 
--        if V_BEGIN =0 
--        and V_Y >17 
--        then --stop the ball if its close to the paddle
--            show_hull;
--            exit;
--        end if;--        insert into T_DEBUG (id,output2,output3) values (V_Num,'PAINT **position '||V_P||' Optcode= '||'','V5= '||V_V5||'Paint '||(V_X-1)||' '||V_Y||' @ ') ;    commit;
    end if;
end loop;--*/
update hull set x3 = V_P where id =0;
update hull set x3 = v_RB where id =1;
commit;--dbms_output.put_line('Number of Block Tiles ='|| V_NUM);  
dbms_output.put_line('Expected BALL POSITIONX = '||V_BX_EXP||' Current PADDLE POSITIONX '|| V_PX ||' MOVE '||V_MOVE||' BALL Direction '||V_DIRY||V_DIRX); 
dbms_output.put_line('BALL POSITION = '||V_BX||' , '||V_BY); 
dbms_output.put_line('Program END'); 
end;

