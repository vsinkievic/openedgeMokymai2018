
define variable i as integer.
define variable j as integer no-undo.

trn:
do transaction:
    ciklas:
    do while j < 10 on error undo, leave: 
       i = i + 1.  
       message i.      
       if i > 10 then j = int("ne integer") no-error.
       if error-status:error
       then undo trn, leave trn.
    end.
    j = 132.
end.
display i j.


