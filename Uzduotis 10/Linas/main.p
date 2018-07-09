
using kLygtis.*.
using kLygtis1.*.


define variable a as decimal no-undo.
define variable b as decimal no-undo.
define variable c as decimal no-undo.
define variable d as class determinant no-undo.

define variable kvadratine as class kLygtis no-undo.
define variable kvadratine1 as class kLygtis1 no-undo.


update a b c help "Áveskite tris skaièius".

d = new determinant(2, 1, 2).

display d:val.

/*kvadratine = new kLygtis(a, b, c).        */
/*                                          */
/*if kvadratine:sprestina() then do:        */
/*    display kvadratine:x1 kvadratine:x2.  */
/*    end.                                  */
/*else do:                                  */
/*    display "Sprendimas negalimas".       */
/*end.                                      */
/*                                          */
/*                                          */
/*                                          */
/*kvadratine1 = new kLygtis1(a, b, c).      */
/*                                          */
/*if kvadratine1:sprestina then do:         */
/*    display kvadratine1:x1 kvadratine1:x2.*/
/*    end.                                  */
/*else do:                                  */
/*    display "Sprendimas negalimas".       */
/*end.                                      */

