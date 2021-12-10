declare
I Number:=0;E Number:=0;G Number:=0;C Number:=0;IP_X Number:=0;EP_X Number:=0;GP_X Number:=0;CP_X Number:=0;IP_Y Number:=0;EP_Y Number:=0;GP_Y Number:=0;CP_Y Number:=0;IP_Z Number:=0;EP_Z Number:=0;GP_Z Number:=0;CP_Z Number:=0;IV_X Number:=0;EV_X Number:=0;GV_X Number:=0;CV_X Number:=0;IV_Y Number:=0;EV_Y Number:=0;GV_Y Number:=0;CV_Y Number:=0;IV_Z Number:=0;EV_Z Number:=0;GV_Z Number:=0;CV_Z Number:=0;
STEP NUMBER:=0;
Begin
IP_X:=19; IP_y:=-10 ;IP_Z:=7 ;
EP_X:=1 ; EP_y:=2   ;EP_Z:=-3;
GP_X:=14; GP_y:=-4  ;GP_Z:=1 ;
CP_X:=8 ; CP_y:=7   ;CP_Z:=-6;

--IP_X:=-1; IP_y:=-0 ;IP_Z:=2 ;
--EP_X:=2 ; EP_y:=-10   ;EP_Z:=-7;
--GP_X:=4; GP_y:=-8  ;GP_Z:=8 ;
--CP_X:=3 ; CP_y:=5   ;CP_Z:=-1; --179 energy

--IP_X:=-8; IP_y:=-10 ;IP_Z:=0 ;
--EP_X:=5 ; EP_y:=5   ;EP_Z:=10;
--GP_X:=2; GP_y:=-7  ;GP_Z:=3 ;
--CP_X:=9 ; CP_y:=-8   ;CP_Z:=-3;
dbms_output.put_line('Program Start');
WHILE STEP <1000 LOOP
--dbms_output.put_line('After '||step||' steps:');
--dbms_output.put_line('IPos=<x= '||IP_X||', y= '||IP_Y||', z= '||IP_Z||'>, vel=<x= '||IV_X||', y= '||IV_Y||', z= '||IV_Z||'>
--EPos=<x= '||EP_X||', y= '||EP_Y||', z= '||EP_Z||'>, vel=<x= '||EV_X||', y= '||EV_Y||', z= '||EV_Z||'>
--GPos=<x= '||GP_X||', y= '||GP_Y||', z= '||GP_Z||'>, vel=<x= '||GV_X||', y= '||GV_Y||', z= '||GV_Z||'>
--CPos=<x= '||CP_X||', y= '||CP_Y||', z= '||CP_Z||'>, vel=<x= '||CV_X||', y= '||CV_Y||', z= '||CV_Z||'>');

------X
   IF IP_X < EP_X THEN IV_X:=IV_X+1;EV_X:=EV_X-1;
ELSIF IP_X > EP_X THEN IV_X:=IV_X-1;EV_X:=EV_X+1;end if;
IF IP_X < GP_X THEN IV_X:=IV_X+1;GV_X:=GV_X-1;
ELSIF IP_X > GP_X THEN IV_X:=IV_X-1;GV_X:=GV_X+1;end if;
IF IP_X < CP_X THEN IV_X:=IV_X+1;CV_X:=CV_X-1;
ELSIF IP_X > CP_X THEN IV_X:=IV_X-1;CV_X:=CV_X+1;end if;
IF EP_X < GP_X THEN EV_X:=EV_X+1;GV_X:=GV_X-1;
ELSIF EP_X > GP_X THEN EV_X:=EV_X-1;GV_X:=GV_X+1;end if;
IF EP_X < CP_X THEN EV_X:=EV_X+1;CV_X:=CV_X-1;
ELSIF EP_X > CP_X THEN EV_X:=EV_X-1;CV_X:=CV_X+1;end if;
IF GP_X < CP_X THEN GV_X:=GV_X+1;CV_X:=CV_X-1;
ELSIF GP_X > CP_X THEN GV_X:=GV_X-1;CV_X:=CV_X+1;end if;
------Y
   IF IP_Y < EP_Y THEN IV_Y:=IV_Y+1;EV_Y:=EV_Y-1;
ELSIF IP_Y > EP_Y THEN IV_Y:=IV_Y-1;EV_Y:=EV_Y+1;end if;
IF IP_Y < GP_Y THEN IV_Y:=IV_Y+1;GV_Y:=GV_Y-1;
ELSIF IP_Y > GP_Y THEN IV_Y:=IV_Y-1;GV_Y:=GV_Y+1;end if;
IF IP_Y < CP_Y THEN IV_Y:=IV_Y+1;CV_Y:=CV_Y-1;
ELSIF IP_Y > CP_Y THEN IV_Y:=IV_Y-1;CV_Y:=CV_Y+1;end if;
IF EP_Y < GP_Y THEN EV_Y:=EV_Y+1;GV_Y:=GV_Y-1;
ELSIF EP_Y > GP_Y THEN EV_Y:=EV_Y-1;GV_Y:=GV_Y+1;end if;
IF EP_Y < CP_Y THEN EV_Y:=EV_Y+1;CV_Y:=CV_Y-1;
ELSIF EP_Y > CP_Y THEN EV_Y:=EV_Y-1;CV_Y:=CV_Y+1;end if;
IF GP_Y < CP_Y THEN GV_Y:=GV_Y+1;CV_Y:=CV_Y-1;
ELSIF GP_Y > CP_Y THEN GV_Y:=GV_Y-1;CV_Y:=CV_Y+1;end if;
------Z
   IF IP_Z < EP_Z THEN IV_Z:=IV_Z+1;EV_Z:=EV_Z-1;
ELSIF IP_Z > EP_Z THEN IV_Z:=IV_Z-1;EV_Z:=EV_Z+1;end if;
IF IP_Z < GP_Z THEN IV_Z:=IV_Z+1;GV_Z:=GV_Z-1;
ELSIF IP_Z > GP_Z THEN IV_Z:=IV_Z-1;GV_Z:=GV_Z+1;end if;
IF IP_Z < CP_Z THEN IV_Z:=IV_Z+1;CV_Z:=CV_Z-1;
ELSIF IP_Z > CP_Z THEN IV_Z:=IV_Z-1;CV_Z:=CV_Z+1;end if;
IF EP_Z < GP_Z THEN EV_Z:=EV_Z+1;GV_Z:=GV_Z-1;
ELSIF EP_Z > GP_Z THEN EV_Z:=EV_Z-1;GV_Z:=GV_Z+1;end if;
IF EP_Z < CP_Z THEN EV_Z:=EV_Z+1;CV_Z:=CV_Z-1;
ELSIF EP_Z > CP_Z THEN EV_Z:=EV_Z-1;CV_Z:=CV_Z+1;end if;
IF GP_Z < CP_Z THEN GV_Z:=GV_Z+1;CV_Z:=CV_Z-1;
ELSIF GP_Z > CP_Z THEN GV_Z:=GV_Z-1;CV_Z:=CV_Z+1;end if;
---POS
IP_X:=IP_X+IV_X; IP_y:=IP_Y+IV_y ;IP_Z:=IP_Z+IV_Z;
EP_X:=EP_X+EV_X; EP_y:=EP_Y+EV_y ;EP_Z:=EP_Z+EV_Z;
GP_X:=GP_X+GV_X; GP_y:=GP_Y+GV_y ;GP_Z:=GP_Z+GV_Z;
CP_X:=CP_X+CV_X; CP_y:=CP_Y+CV_y ;CP_Z:=CP_Z+CV_Z;

STEP:=STEP+1;

END LOOP;

----ENERGY
I:=(ABS(IV_X)+ ABS(IV_y)+ ABS(IV_Z))*(ABS(IP_X)+ ABS(IP_y)+ ABS(IP_Z));
E:=(ABS(EV_X)+ ABS(EV_y)+ ABS(EV_Z))*(ABS(EP_X)+ ABS(EP_y)+ ABS(EP_Z));
G:=(ABS(GV_X)+ ABS(GV_y)+ ABS(GV_Z))*(ABS(GP_X)+ ABS(GP_y)+ ABS(GP_Z));
C:=(ABS(CV_X)+ ABS(CV_y)+ ABS(CV_Z))*(ABS(CP_X)+ ABS(CP_y)+ ABS(CP_Z));
dbms_output.put_line('Sum of total energy ='||(i+e+g+c));  
dbms_output.put_line('Program END');  
end;

