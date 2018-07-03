
using Progress.Lang.*.
using OpenEdge.Core.Assert from propath.

block-level on error undo, throw.

{function.i} 

define variable answer as log no-undo.
define variable pA as decimal no-undo.
define variable pB as decimal no-undo.
define variable pC as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.

@Test.
procedure determinantIsZero:
    //given
    assign pA = 2 pB = 4 pC = 2.
    //when
    answer = solveEquation(pA, pB, pC, output x1, output x2).
    //then
    Assert:Equals(-1, x1).
    Assert:Equals(-1, x2).
    Assert:isTrue(answer).
end procedure.

@Test.
procedure determinantIsNegative:
   //given
   assign pA = 4 pB = 2 pC = 4.
   //when
   answer = solveEquation(pA, pB, pC, output x1, output x2).
   //then
   Assert:Equals(?, x1).
   Assert:Equals(?, x2).
   Assert:isFalse(answer).
end procedure.

@Test.
procedure inputIsZero:
   //given
   assign pA = 0 pB = 0 pC = 0.
   //when
   answer = solveEquation(pA, pB, pC, output x1, output x2).
   //then
   Assert:Equals(?, x1).
   Assert:Equals(?, x2).
   Assert:isFalse(answer).
end procedure.