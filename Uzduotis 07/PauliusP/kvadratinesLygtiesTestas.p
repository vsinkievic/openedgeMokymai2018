 
 /*------------------------------------------------------------------------
    File        : kvadratinesLygtiesTestas.p 
    Syntax      : 
    Author(s)   : Studentas
    Created     : Tue Jul 03 15:01:07 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING OpenEdge.Core.Assert FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

define variable A as integer no-undo.
define variable B as integer no-undo.
define variable C as integer no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.
define variable ans as log no-undo.
{skaiciavimai.i}

/* **********************  Internal Procedures  *********************** */

@Test.
PROCEDURE ar_neigiamas:   
    //given
    A = 50.
    B = 4.
    C = -50.
    //when
    ans = solveEquation(A, B, C, x1, x2).
    //then
    Assert:IsNegative(x1).
END PROCEDURE.

@Test.
PROCEDURE ar_lygus:   
    //given
    A = 1.
    B = 2.
    C = 1.
    //when
    ans = solveEquation(A, B, C, x1, x2).
    //then
    Assert:Equals(?, x2).
    Assert:isTrue(ans).
END PROCEDURE.

@Test.
PROCEDURE salyga_atitinka:   
    //given
    A = 2.
    B = 4.
    C = 2.
    //when
    ans = solveEquation(A, B, C, x1, x2).
    //then
    Assert:isTrue(ans).
END PROCEDURE. 
