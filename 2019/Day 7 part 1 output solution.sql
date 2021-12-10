select * from thrusters where 
substr(config,1,1) != substr(config,2,1)
and substr(config,1,1) != substr(config,3,1)
and substr(config,1,1) != substr(config,4,1)
and substr(config,1,1) != substr(config,5,1)
and substr(config,2,1) != substr(config,3,1)
and substr(config,2,1) != substr(config,4,1)
and substr(config,2,1) != substr(config,5,1)
and substr(config,3,1) != substr(config,4,1)
and substr(config,3,1) != substr(config,5,1)
and substr(config,4,1) != substr(config,5,1)
order by 2 desc

;