 
 /*------------------------------------------------------------------------
    File        : lygties_testas.p 
    Syntax      : 
    Author(s)   : Studentas
    Created     : Tue Jul 03 15:00:45 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using OpenEdge.Core.Assert from propath.

block-level on error undo, throw.

{kvadratines_lygties_skaiciavimai.i}

define variable A as decimal no-undo.
define variable B as decimal no-undo.
define variable C as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.
define variable ats as log no-undo.




/* **********************  Internal Procedures  *********************** */


@Test.
procedure X_EXIST:
//given
A = 2.
B = 1.
C = 3.

//when
ats = solveEquation(A, B, C, x1, x2).
//then
Assert:Equals(?, x1).
Assert:Equals(?, x2).
Assert:isFalse(ats).
end procedure.

@Test.
procedure ONE_SOLUTION:
//given
A = 1.
B = 2.
C = 1.

//when
ats = solveEquation(A, B, C, x1, x2).
//then
Assert:isTrue(ats).
Assert:Equals(?, x2).
end procedure.


@Test.
procedure TWO_SOLUTION:
//given
A = 1.
B = 4.
C = 1.

//when
ats = solveEquation(A, B, C, x1, x2).
//then
Assert:isTrue(ats).
end procedure.




@Setup.
procedure setUp:
/*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
------------------------------------------------------------------------------*/

end procedure.  
