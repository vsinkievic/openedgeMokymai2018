define variable pA as decimal no-undo.
define variable pB as decimal no-undo.
define variable pC as decimal no-undo.

define variable eqSolver1 as class qEquation1 no-undo.
define variable eqSolver2 as class qEquation2 no-undo.

define frame ui "Iveskite kvadratines lygties koeficientus (a, b, c):" skip(1) pA pB pC.
update pA label "a" pB label "b" pC label "c" with frame ui.

/*                 Pirmas variantas (su konstruktoriumi)                  */
eqSolver1 = new qEquation1(pA, pB, pC).
if eqSolver1:isSolvable
then display eqSolver1:x1 eqSolver1:x2.
else message "Lygtis neturi sprendiniu!" view-as alert-box.

/*                           Antras variantas                              */
/*eqSolver2 = new qEquation2().                                            */
/*if (eqSolver2:hasSolution(pA, pB, pC))                                   */
/*then display eqSolver2:x1 eqSolver2:x2.                                  */
/*else message "Lygtis neturi sprendiniu!" view-as alert-box.              */