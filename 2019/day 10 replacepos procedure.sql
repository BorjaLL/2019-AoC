CREATE OR REPLACE FUNCTION replacepos(  
                        source_in      IN VARCHAR2  
        ,               replacechar_in IN VARCHAR2  
        ,               position_in    IN NUMBER)   
    RETURN VARCHAR2   
    IS  
        l_returnvalue VARCHAR2(32767);  
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
      RETURN l_returnvalue;  
    END replacepos;  