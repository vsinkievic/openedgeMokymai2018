

define variable cTekstas as character no-undo init "Hello".
define variable cKitas as character no-undo.

message "A" cTekstas cKitas.

run strukturinis/external_2.p (input-output cTekstas, output cKitas) no-error. 
if error-status:error
then message return-value view-as alert-box error.

message "B" cTekstas cKitas.

message "Return value" return-value.