create or replace NONEDITIONABLE procedure intcode0 (
V_p in out Number,
V_V5 in out number,
V_dvalue in out number,
V_RB in out number --relative base
,V_GO in out number
,V_debugID in out number
)

is
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
    mod1     NUMBER:= 0;
    mod2     NUMBER:= 0;
    mod3     NUMBER:= 0;
    V_BIG    NUMBER:=0;
    

BEGIN
V5:=V_V5;
p:=V_p;

    SELECT MAX(id) INTO fin FROM csv;    

    WHILE ( p < fin
    ) LOOP

        SELECT value0 INTO dvalue1 FROM csv  WHERE id = p;  
        SELECT length(dvalue1) INTO l1 FROM dual;  --dbms_output.put_line('Length ='||L1);
        if substr(dvalue1,1,2) = 99 then
        dvalue:=99;
        else Select substr(dvalue1,L1,1) into dvalue from dual; 
        end if;
        mod1:=0;
        mod2:=0;
        mod3:=0;
        If L1 >2 then Select substr(dvalue1,L1-2,1) into mod1 from dual;   --dbms_output.put_line('mod1 ='||mod1);
            IF L1>3 then Select substr(dvalue1,L1-3,1) into mod2 from dual;  --dbms_output.put_line('mod2 ='||mod2);
                IF L1>4 then Select substr(dvalue1,L1-4,1) into mod3 from dual;  --dbms_output.put_line('mod2 ='||mod2);
                END IF;
            END IF;
        END IF;
        
     --   if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,'BEGIN **position '||P||' Optcode= '||dvalue1,'V5= '||V5||' Relative base = '||V_RB) ;    commit; V_debugID:=V_debugID+1; end if;
        
        select case 
                           when exists( select id from csv where id =fin+1) then 1
                           else 0
                           end into V_BIG from dual;
                                if V_BIG=0 then
                                insert INTO csv (id, value0) VALUES (fin+1,'0' );
                                end if;
        select case 
                           when exists( select id from csv where id =fin+2) then 1
                           else 0
                           end into V_BIG from dual;
                                if V_BIG=0 then
                                insert INTO csv (id, value0) VALUES (fin+2,'0' );
                                end if;
        select case 
                           when exists( select id from csv where id =fin+3) then 1
                           else 0
                           end into V_BIG from dual;
                                if V_BIG=0 then
                                insert INTO csv (id, value0) VALUES (fin+3,'0' );
                                end if;
        SELECT value0 INTO t1 FROM csv WHERE id = p+1;
        select case 
                           when exists( select id from csv where id =t1) then 1
                           else 0
                           end into V_BIG from dual;
                                if V_BIG=0 and t1>0 then
                                insert INTO csv (id, value0) VALUES (t1,'0' );
                                end if;
        SELECT value0 INTO t1 FROM csv WHERE id = p+2;
        select case 
                           when exists( select id from csv where id =t1) then 1
                           else 0
                           end into V_BIG from dual;
                                if V_BIG=0 and t1>0 then
                                insert INTO csv (id, value0) VALUES (t1,'0' );
                                end if;
        SELECT value0 INTO t1 FROM csv WHERE id = p+3;
        select case 
                           when exists( select id from csv where id =t1) then 1
                           else 0
                           end into V_BIG from dual;
                                if V_BIG=0 and t1>0 then
                                insert INTO csv (id, value0) VALUES (t1,'0' );
                                end if;                       
        SELECT value0+V_RB INTO t1 FROM csv WHERE id = p+1;
        select case 
                           when exists( select id from csv where id =t1) then 1
                           else 0
                           end into V_BIG  from dual;
                                if V_BIG=0 and t1 >0 then
                                insert INTO csv (id, value0) VALUES (t1,'0' );
                                end if;
        SELECT value0+V_RB INTO t1 FROM csv WHERE id = p+2;
        select case 
                           when exists( select id from csv where id =t1) then 1
                           else 0
                           end into V_BIG from dual;
                                if V_BIG=0 and t1+V_RB >0 then
                                insert INTO csv (id, value0) VALUES (t1,'0' );
                                end if;
        SELECT value0+V_RB INTO t1 FROM csv WHERE id = p+3;
        select case 
                           when exists( select id from csv where id =t1) then 1
                           else 0
                           end into V_BIG from dual;
                                if V_BIG=0 and t1+V_RB >0 then
                                insert INTO csv (id, value0) VALUES (t1,'0' );
                                end if;
                                
        
        IF dvalue = 99 THEN --99 end
            V_dvalue:=dvalue;
            V_P:=p;
            commit;
            if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,'HIT 99 should end position= '||P||' Optcode= '||dvalue1,'V5= '||V5||' Relative base = '||V_RB) ; commit; V_debugID:=V_debugID+1; end if;
            EXIT;  

        ELSIF (dvalue = 1 or dvalue = 2)  THEN --sum 
            p1 := p;
            p2 := p + 1;
            p3 := p + 2;
            p4 := p + 3;

            if mod1 = 1 then 
                SELECT value0 INTO V1 FROM csv WHERE id = p2;
            elsif mod1 = 0 then 
                SELECT value0 INTO t1 FROM csv WHERE id = p2; 
                SELECT value0 INTO v1 FROM csv WHERE id = t1;
            elsif mod1 = 2 then 
                SELECT value0 INTO t1 FROM csv WHERE id = p2;
                SELECT value0 INTO v1 FROM csv WHERE id = t1+V_RB;
            end if; 
            if mod2 = 1 then 
                SELECT value0 INTO V2 FROM csv WHERE id = p3;
            elsif mod2 = 0 then 
                SELECT value0 INTO t2 FROM csv WHERE id = p3;
                SELECT value0 INTO v2 FROM csv WHERE id = t2;
            elsif mod2 = 2 then 
                SELECT value0 INTO t2 FROM csv WHERE id = p3;
                SELECT value0 INTO v2 FROM csv WHERE id = t2+V_RB;
            end if;
            if mod3 = 0 then 
                SELECT value0 INTO t3 FROM csv WHERE id = p4;
            elsif mod3 = 2 then 
                SELECT value0+V_RB INTO t3 FROM csv WHERE id = p4;
            end if;          
               
                if dvalue = 1 then v4 := v1 + v2;
             elsif dvalue = 2 then v4 := v1 * v2;
                end if;
            UPDATE csv SET value0 = v4 WHERE id = t3; commit;
if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,'position '||P||' Optcode= '||dvalue1||' V1= '||v1||' V2= '||v2||' New value= '||v4|| ' target= '||t3|| ' p4= '||p4,'V5= '||V5||' Relative base = '||V_RB) ; commit; V_debugID:=V_debugID+1; end if;

            p := p4 + 1;

 ------------------------------------------------------------------------------------------------------------
        ELSIF dvalue = 3 THEN
            p1 := p;
            p2 := p + 1;
           
            if mod1 = 0 then 
                SELECT value0 INTO t3 FROM csv WHERE id = p2; 
                UPDATE csv SET value0 = V5 WHERE id = t3; 
            elsif mod1 = 2 then 
                SELECT value0+V_RB INTO t3 FROM csv WHERE id = p2; 
                UPDATE csv SET value0 = V5 WHERE id = t3; 
            End if;
            p := p2 + 1;
            
            
            
if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,'position '||P||' Optcode= '||dvalue1||' target= '||t3,'V5= '||V5||' Relative base = '||V_RB) ; commit; V_debugID:=V_debugID+1; end if; 

        ELSIF dvalue = 4 THEN
            p1 := p;
            p2 := p + 1;
            if mod1 = 1 then 
                SELECT value0 INTO V5 FROM csv WHERE id = p2;
            elsif mod1 = 0 then 
                SELECT value0 INTO t1 FROM csv WHERE id = p2; 
                SELECT value0 INTO v5 FROM csv WHERE id = t1;
            elsif mod1 = 2 then 
                SELECT value0 INTO t1 FROM csv WHERE id = p2; 
                SELECT value0 INTO v5 FROM csv WHERE id = t1+V_RB;
            End if;

            p := p2 + 1;
            V_dvalue:=dvalue;
            V_V5:=V5;
            V_p:=p;
            commit;
             if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,'OUT position '||P||' Optcode= '||dvalue1,'V5= '||V5||' Relative base = '||V_RB) ;    commit; V_debugID:=V_debugID+1; end if;
            exit;

------------------part 2----------------------------------------------------------------------------------------
         ELSIF  (dvalue = 5 or dvalue = 6) THEN
            p1 := p;
            p2 := p + 1;
            p3 := p + 2;
            if mod1 = 1 then 
                SELECT value0 INTO V1 FROM csv WHERE id = p2;
            elsif mod1 = 0 then 
                SELECT value0 INTO t1 FROM csv WHERE id = p2; 
                SELECT value0 INTO v1 FROM csv WHERE id = t1;
            elsif mod1 = 2 then 
                SELECT value0 INTO t1 FROM csv WHERE id = p2; 
                SELECT value0 INTO v1 FROM csv WHERE id = t1+V_RB;
            end if; 
            if mod2 = 1 then 
                SELECT value0 INTO V2 FROM csv WHERE id = p3;
            elsif mod2 = 0 then 
                SELECT value0 INTO t2 FROM csv WHERE id = p3;
                SELECT value0 INTO v2 FROM csv WHERE id = t2;
            elsif mod2 = 2 then 
                SELECT value0 INTO t2 FROM csv WHERE id = p3;
                SELECT value0 INTO v2 FROM csv WHERE id = t2+V_RB;
            end if;
            if dvalue = 5 and V1 != 0 then SELECT V2 INTO p FROM dual;  
        if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,'position '||P||' TELEPORT!=0 '||dvalue1||' MOD2 '||mod2||' V1= '||v1||' New position V2= '||v2,'V5= '||V5||' Relative base = '||V_RB) ; commit; V_debugID:=V_debugID+1; end if;
            
         elsif dvalue = 6 and V1 = 0 then SELECT V2 INTO p FROM dual; 
         if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,'position '||P||' TELEPORT =0 '||dvalue1||' MOD2 '||mod2||' V1= '||v1||' New position V2= '||v2,'V5= '||V5||' Relative base = '||V_RB) ; commit; V_debugID:=V_debugID+1; end if;
            ELSE p:=p3+1;
            end if;

        ELSIF (dvalue = 7 or dvalue = 8)  THEN --sum 
            p1 := p;
            p2 := p + 1;
            p3 := p + 2;
            p4 := p + 3;

            if mod1 = 1 then 
                SELECT value0 INTO V1 FROM csv WHERE id = p2;
            elsif mod1 = 0 then 
                SELECT value0 INTO t1 FROM csv WHERE id = p2; 
                SELECT value0 INTO v1 FROM csv WHERE id = t1;
            elsif mod1 = 2 then 
                SELECT value0 INTO t1 FROM csv WHERE id = p2; 
                SELECT value0 INTO v1 FROM csv WHERE id = t1+V_RB;
            end if; 
            if mod2 = 1 then 
                SELECT value0 INTO V2 FROM csv WHERE id = p3;
            elsif mod2 = 0 then 
                SELECT value0 INTO t2 FROM csv WHERE id = p3;
                SELECT value0 INTO v2 FROM csv WHERE id = t2;
            elsif mod2 = 2 then 
                SELECT value0 INTO t2 FROM csv WHERE id = p3;
                SELECT value0 INTO v2 FROM csv WHERE id = t2+V_RB;
            end if;
            if mod3 = 0 then 
                SELECT value0 INTO t3 FROM csv WHERE id = p4;
            elsif mod3 = 2 then 
                SELECT value0+V_RB INTO t3 FROM csv WHERE id = p4;
            end if;           

                if dvalue = 7 and V1<V2 then v4 :=1;
                elsif dvalue = 8 and V1=V2 then v4 :=1;
                else v4:=0;
                end if;
                
                UPDATE csv SET value0 = v4 WHERE id = t3;
if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,'position '||P||' Optcode= '||dvalue1||' V1= '||v1||' V2= '||v2||' New value= '||v4|| ' target= '||t3,'V5= '||V5||' Relative base = '||V_RB) ; commit; V_debugID:=V_debugID+1; end if;
                p := p4 + 1;
                
        elsif dvalue = 9 THEN --sum 
            p1 := p;
            p2 := p + 1;      
            if mod1 = 1 then 
                SELECT value0 INTO V1 FROM csv WHERE id = p2;
            elsif mod1 = 0 then 
                SELECT value0 INTO t1 FROM csv WHERE id = p2; 
                SELECT value0 INTO v1 FROM csv WHERE id = t1;
            elsif mod1 = 2 then 
                SELECT value0 INTO t1 FROM csv WHERE id = p2; 
                SELECT value0 INTO v1 FROM csv WHERE id = t1+V_RB;
            end if; 
            V_RB:=V_RB+V1;
--if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,dvalue1||' mod1= '||mod1||' V1= '||V1||' p2= '||P2||' t1= '||t1,'V5= '||V5||' Relative base = '||V_RB) ; commit; V_debugID:=V_debugID+1; end if;  
if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,'position '||P||' ADD TO Relative Base '||dvalue1||' V1= '||v1,'V5= '||V5||' Relative base = '||V_RB) ; commit; V_debugID:=V_debugID+1; end if;          
            p := p2 + 1;
            
                
                
        ELSE
--                                    dbms_output.put_line('decision value0 ='||dvalue1);
--                                    dbms_output.put_line('this wasnt a 1,2,3,4 or 99');
                p := p + 1;
                V_dvalue:=dvalue;
                Exit;      
         END IF;
   --  if V_GO = 0 then insert into T_DEBUG (id,output0,output1) values (V_debugID,'END *position '||P||' Optcode= '||dvalue1,'V5= '||V5||' Relative base = '||V_RB) ;    commit; V_debugID:=V_debugID+1; end if;
 commit;    
   end loop;


--*/
 

--insert into  T_DEBUG (id,output0) values (V_MODE,V5) ;    commit;



END;