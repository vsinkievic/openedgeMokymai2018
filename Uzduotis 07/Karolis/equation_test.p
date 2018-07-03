 
 /*------------------------------------------------------------------------
    File        : equation_test.p 
    Syntax      : 
    Author(s)   : Studentas
    Created     : Tue Jul 03 17:42:01 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using OpenEdge.Core.Assert from propath.

block-level on error undo, throw. 

{function.i}
define variable A as decimal no-undo.
define variable B as decimal no-undo.
define variable C as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.
define variable equation-result as log no-undo.



/* **********************  Internal Procedures  *********************** */

@Test.
procedure ArSprendziaLygti:
//given
A = 4.
B = 10.
C = 1.

//then
equation-result = solveEquation(A, B, C, x1, x2).

end procedure.

@Test.
procedure arSprendziaLygtiSuVienuSprendiniu:
//given
A = 4.
B = 4.
C = 1.

//then
equation-result = solveEquation(A, B, C, x1, x2).
Assert:Equals(x1,x2).


end procedure.

@Test.
procedure arNullKaiDeterminantasMaziauUzNuli:
//given
A = 8.
B = 4.
C = 1.

//then
equation-result = solveEquation(A, B, C, x1, x2).
Assert:Equals(?,x2).
Assert:Equals(?,x1).


end procedure.
