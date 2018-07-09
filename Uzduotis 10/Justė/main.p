define variable dA as decimal no-undo label "A" format "->>>>>>9.9999999".
define variable dB as decimal no-undo label "B" format "->>>>>>9.9999999".
define variable dC as decimal no-undo label "C" format "->>>>>>9.9999999".

define variable eq1 as class QuadraticEquation no-undo.
define variable eq2 as class QuadraticEquation2 no-undo.

define frame fUI skip dA skip dB skip dC with 1 col side-labels center
                title "Áveskite kvadratinës lygties koeficientus.".
    
update dA dB dC with frame fUI.

eq1 = new QuadraticEquation(dA,dB,dC).
if eq1:lCanBeSolved
then display eq1:dX1 label "X1:" format "->>>>>>9.9999999"
             eq1:dX2 label "X2:" format "->>>>>>9.9999999"
             with row 10 1 col side-labels center title "Rezultatas 1".
else message "Lygtis neturi sprendiniø." view-as alert-box.

/*--------------------------------Antras variantas--------------------------------*/
/*eq2 = new QuadraticEquation2().                                        */
/*if(eq2:isSolvable(dA,dB,dC))                                           */
/*then display eq2:dX1 label "X1:" format "->>>>>>9.9999999"             */
/*             eq2:dX2 label "X2:" format "->>>>>>9.9999999"             */
/*             with row 15 1 col side-labels center title "Rezultatas 2".*/
/*else message "Lygtis neturi sprendiniø." view-as alert-box.            */


