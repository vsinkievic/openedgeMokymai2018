{quadr_equation_lib.i}
define variable dA as decimal no-undo label "A" format "->>>>>>9.9999999".
define variable dB as decimal no-undo label "B" format "->>>>>>9.9999999".
define variable dC as decimal no-undo label "C" format "->>>>>>9.9999999".
define variable dx1 as decimal no-undo label "X1" format "->>>>>>9.9999999".
define variable dx2 as decimal no-undo label "X2" format "->>>>>>9.9999999".
define variable lError as log no-undo.

define frame fUI skip dA skip dB skip dC with 1 col side-labels center
                title "Áveskite kvadratinës lygties koeficientus.".
    
define frame fRez dx1 skip dx2 with 1 col side-labels center title "Rezultatas".
    
update dA dB dC with frame fUI.

assign lError = solveEquation(dA,dB,dC,output dx1,output dx2).

if not lError then message "Lygtis neturi sprendiniø." view-as alert-box.
else display dx1 dx2 with frame fRez.

