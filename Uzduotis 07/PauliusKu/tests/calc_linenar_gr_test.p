 
 /*------------------------------------------------------------------------
    File        : calc_linenar_gr_test.p 
    Syntax      : 
    Author(s)   : Studentas
    Created     : Tue Jul 03 17:29:51 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING OpenEdge.Core.Assert FROM PROPATH.

{src/calc_linenar_gr.i}

DEFINE VARIABLE A as decimal NO-UNDO.
DEFINE VARIABLE B as decimal NO-UNDO.
DEFINE VARIABLE C as decimal NO-UNDO.
DEFINE VARIABLE x1 as decimal NO-UNDO.
DEFINE VARIABLE x2 as decimal NO-UNDO.
DEFINE VARIABLE answ as log NO-UNDO.


@Test.
PROCEDURE NO_SOLUTION:
//given
A = 2.
B = 1.
C = 3.

//when
answ = solveQuadraticEquation(A, B, C, x1, x2).
//then
Assert:Equals(?, x1).
Assert:Equals(?, x2).
Assert:isFalse(answ).
END PROCEDURE.

@Test.
PROCEDURE ONE_SOLUTION:
//given
A = 1.
B = 2.
C = 1.

//when
answ = solveQuadraticEquation(A, B, C, x1, x2).
//then
Assert:isTrue(answ).
Assert:Equals(?, x2).
END PROCEDURE.


@Test.
PROCEDURE TWO_SOLUTION1:
//given
A = -1.
B = -4.
C = 5.

//when
answ = solveQuadraticEquation(A, B, C, x1, x2).
//then
Assert:isTrue(answ).
Assert:Equals( -5, x1).
Assert:Equals( 1, x2).
END PROCEDURE.

@Test.
PROCEDURE TWO_SOLUTION2:
//given
A = 1.
B = 1.
C = -6.

//when
answ = solveQuadraticEquation(A, B, C, x1, x2).
//then
Assert:isTrue(answ).
Assert:Equals( 2, x1).
Assert:Equals(-3, x2).
END PROCEDURE.