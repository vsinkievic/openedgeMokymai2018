trigger procedure for create of acr.

assign 
  
   acr.crtd_by = line.config.LineContext:CurrentCxt:EmpId
   acr.crtd_on = now
   acr.updt_by = acr.crtd_by
   acr.updt_on = acr.crtd_on.

