CREATE OR REPLACE PROCEDURE ANG_RANK (V_X in out number, V_Y in out number)
IS
BEGIN

  DELETE (SELECT *
        FROM (select abs(x-(V_X-1))+abs(y-V_Y) sum,ang from angles ) pf
        INNER JOIN (select ang, min(sum) sum from (select abs(x-(V_X-1))+abs(y-V_Y)sum,ang from angles ) group by ang ) pr
            ON pf.ang = pr.ang
        WHERE pf.sum != pr.sum);
MERGE INTO angles t USING
(select  id,x,y,ang,rank() over (order by ang desc) as rank  from angles
) s 
ON(t.ang = s.ang)
WHEN MATCHED THEN
  UPDATE SET t.id = s.rank;
  
  COMMIT;

END;