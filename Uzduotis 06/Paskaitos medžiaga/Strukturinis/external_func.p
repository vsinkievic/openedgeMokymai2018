

define variable cTekstas as character no-undo init "Hello".
define variable cKitas as character no-undo.
define variable cPapildomas as character no-undo.

define variable cBendras as character no-undo init "Bendras".
{strukturinis/function-lib.i}

message "A" cTekstas cKitas.

// run strukturinis/external_2.p (input-output cTekstas, output cKitas). 

cKitas = testas(cTekstas, output cPapildomas).

message "B" cTekstas cKitas cPapildomas cBendras.



