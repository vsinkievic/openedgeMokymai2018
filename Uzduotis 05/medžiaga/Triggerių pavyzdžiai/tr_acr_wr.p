trigger procedure for write of acr
   new buffer newRec old buffer oldRec.

def var isSame as log no-undo.


assign newRec.updt_by = line.config.LineContext:CurrentCxt:EmpId
       newRec.updt_on = now.

buffer-compare oldRec except ver crtd_on crtd_by updt_on updt_by
   to newRec save result in isSame.
   
if not isSame
then newRec.ver = oldRec.ver + 1.
