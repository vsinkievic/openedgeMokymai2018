using Progress.Lang.*.
using OpenEdge.Core.Assert from propath.

block-level on error undo, throw.

{quadr_equation_lib.i}
define variable dA as decimal no-undo label "A".
define variable dB as decimal no-undo label "B".
define variable dC as decimal no-undo label "C".
define variable dx1 as decimal no-undo label "X1".
define variable dx2 as decimal no-undo label "X2".
define variable lError as log no-undo.

@Test.
procedure validateInputZero:
    //given
    assign dA = 0
           dB = 0
           dC = 0.
   //when
   lError = solveEquation(dA,dB,dC,output dx1, output dx2).
   //then
   Assert:Equals(?,dx1).
   Assert:Equals(?,dx2).
   Assert:isFalse(lError).
end procedure.

@Test.
procedure detNegative:
    //given
    assign dA = 9
           dB = 0
           dC = 1.
   //when
   lError = solveEquation(dA,dB,dC,output dx1, output dx2).
   //then
   Assert:Equals(?,dx1).
   Assert:Equals(?,dx2).
   Assert:isFalse(lError).
end procedure.

@Test.
procedure detZero:
    //given
    assign dA = 1
           dB = 2
           dC = 1.
    //when
    lError = solveEquation(dA,dB,dC,output dx1, output dx2).
    //then
    Assert:Equals(- 1,dx1).
    Assert:Equals(- 1,dx2).
    Assert:isTrue(lError).
end procedure.

@Test.
procedure worksWithDecimals:
    //given
    assign dA = 489.45
           dB = 37.11
           dC = -2000.48.
    //when
    lError = solveEquation(dA,dB,dC,output dx1, output dx2).
    //then
    Assert:Equals(1.9841279540703,dx1).
    Assert:Equals(-2.0599477518025,dx2).
    Assert:isTrue(lError).
end procedure.