SET SERVEROUTPUT ON;

DECLARE
    TYPE t_pattern_rec IS RECORD (
        p_value   NUMBER
        ,i_value   NUMBER
        ,i_value2   NUMBER
        , model     VARCHAR2(50)
    );
    TYPE t_pattern_tab IS
        TABLE OF t_pattern_rec INDEX BY PLS_INTEGER;
    t_base_pattern   t_pattern_tab;
    t_pattern        t_pattern_tab;
    v_input varchar2(32000):=12345678;
    v_input3 varchar2(32000):='59787832768373756387231168493208357132958685401595722881580547807942982606755215622050260150447434057354351694831693219006743316964757503791265077635087624100920933728566402553345683177887856750286696687049868280429551096246424753455988979991314240464573024671106349865911282028233691096263590173174821612903373057506657412723502892841355947605851392899875273008845072145252173808893257256280602945947694349746967468068181317115464342687490991674021875199960420015509224944411706393854801616653278719131946181597488270591684407220339023716074951397669948364079227701367746309535060821396127254992669346065361442252620041911746738651422249005412940728';
    len_input number;
    ans1 number:=0;
    v_input2 varchar2(32000):=0;
    v_phase number:=0;
    PROCEDURE replacepos(  
                            source_in      IN varchar2  
            ,               replacechar_in IN VARCHAR2  
            ,               position_in    IN NUMBER
            ,               l_returnvalue  IN OUT VARCHAR2  )
        IS  
           -- l_returnvalue VARCHAR2(32767);  
        BEGIN  
          -- copy from the source string up to, but not including,  
          -- the character position  
          -- to be replaced  
          l_returnvalue := substr( str1 => source_in  
                                 , pos => 1  
                                 , len => position_in - 1);  
          -- add the replacement character  
          -- just a single character, but more can be sent in,  
          -- so substring the parameter  
          l_returnvalue := l_returnvalue ||  
                            substr( str1 => replacechar_in  
                                  , pos => 1  
                                  , len => 1);  
          -- copy the rest of the source string  
          l_returnvalue := l_returnvalue ||  
                            substr( str1 => source_in  
                                  , pos => position_in + 1);  
         -- RETURN l_returnvalue;  
    END replacepos;  

    PROCEDURE show_pattern IS
        pattern_idx PLS_INTEGER;
    BEGIN
        pattern_idx := t_pattern.first;
        LOOP
            EXIT WHEN pattern_idx IS NULL;
            dbms_output.put_line('Position '
                                 || pattern_idx
                                 || ' is '
                                 || t_pattern(pattern_idx).i_value2);

            pattern_idx := t_pattern.next(pattern_idx);
        END LOOP;

    END;
    PROCEDURE create_pattern ( len_start in number, len_input in number, p_pattern in number, p_position in number) IS
    pattern_idx pls_integer;
    V_position number;
    BEGIN
    V_position:=p_position;
            FOR v_count in len_start..(len_start-1+(4)) loop
                for v_count2 in 1 .. p_pattern loop
                exit when  v_position > len_input+1;
               t_pattern(v_position).p_value := t_base_pattern(v_count-len_start+1).p_value;
               v_position:=v_position+1;
--               dbms_output.put_line('Position t_pattern '
--                                     || v_count
--                                     || ' is t_base_pattern '
--                                     || (v_count-len_start+1));       
                END LOOP;
            end loop;
        if v_position<=len_input+1 then
            create_pattern(len_start+4,len_input,p_pattern,v_position);
        end if;
       
        if v_position>len_input+1 then
            for v_count in 1.. len_input loop
                 t_pattern(v_count).p_value := t_pattern(v_count+1).p_value;
--                 dbms_output.put_line('Position t_pattern '
--                                 || v_count
--                                 || ' is t_pattern '
--                                 || (v_count+1));
            end loop;
        end if;
    END;
    PROCEDURE FFT (v_input in out varchar2, len_input in out number, ans out number,v_input2 in out varchar2, v_phase in number) is
    
    begin
        for v_count3 in 1..v_phase loop
            for v_count2 in 1..len_input loop
                ans:=0;
                create_pattern(1,len_input,v_count2,1);
                for v_count in 1..len_input loop
                    ans:= ans+substr(v_input,v_count,1)* t_pattern(v_count).p_value;
--                    dbms_output.put_line(v_count2||'  '||substr(v_input,v_count,1)||'  '|| t_pattern(v_count).p_value||'  '||substr(v_input,v_count,1)* t_pattern(v_count).p_value||'  ' ||SUBSTR(ans,-1));
                end loop;
                t_pattern(v_count2).i_value2 := SUBSTR(ans,-1);
--                dbms_output.put_line(v_count2||'  '||SUBSTR(ans,-1));
            end loop;
            for v_count in 1..len_input loop
                replacepos(v_input2, t_pattern(v_count).i_value2 ,v_count,v_input2);
--                 dbms_output.put_line(v_input2);
            end loop;
--            dbms_output.put_line(v_input2);
            v_input:=v_input2;
        end loop;
    end;

BEGIN
    v_input:='59787832768373756387231168493208357132958685401595722881580547807942982606755215622050260150447434057354351694831693219006743316964757503791265077635087624100920933728566402553345683177887856750286696687049868280429551096246424753455988979991314240464573024671106349865911282028233691096263590173174821612903373057506657412723502892841355947605851392899875273008845072145252173808893257256280602945947694349746967468068181317115464342687490991674021875199960420015509224944411706393854801616653278719131946181597488270591684407220339023716074951397669948364079227701367746309535060821396127254992669346065361442252620041911746738651422249005412940728';
    len_input:=length(v_input);
    v_phase:=100;
  -- using sequential index values
    t_base_pattern(1).p_value := 0;
    t_base_pattern(2).p_value := 1;
    t_base_pattern(3).p_value := 0;
    t_base_pattern(4).p_value := -1;
--    create_pattern(1,len_input,1,1);
--    show_pattern;
    FFT(v_input,len_input,ans1,v_input2,v_phase);
    --show_pattern;
    
    dbms_output.put_line(v_input2);
   -- dbms_output.put_line(v_input3);
    
    

END;