using Progress.Lang.*.
using OpenEdge.Core.Assert from propath.

block-level on error undo, throw.

class QuadraticEquationTests:
    
    define variable dA as decimal no-undo.
    define variable dB as decimal no-undo.
    define variable dC as decimal no-undo.
    
    define variable eq1 as QuadraticEquation no-undo.
    define variable eq2 as QuadraticEquation2 no-undo.
    define variable isSolvable1 as log no-undo.
    define variable isSolvable2 as log no-undo.
    
    @Test.
    method public void validateInputZero():
        //given
        assign dA = 0
               dB = 0
               dC = 0.
        eq1 = new QuadraticEquation(dA,dB,dC).
        eq2 = new QuadraticEquation2().
        //when
        isSolvable1 = eq1:lCanBeSolved.
        isSolvable2 = eq2:isSolvable(dA,dB,dC).
        //then
        Assert:Equals(?,eq1:dX1).
        Assert:Equals(?,eq1:dX2).
        Assert:Equals(?,eq2:dX1).
        Assert:Equals(?,eq2:dX2).
        Assert:isFalse(isSolvable1).
        Assert:isFalse(isSolvable2).
    end.
    
    @Test.
    method public void detNegative():
        //given
        assign dA = 9
               dB = 0
               dC = 1.
        eq1 = new QuadraticEquation(dA,dB,dC).
        eq2 = new QuadraticEquation2().
        //when
        isSolvable1 = eq1:lCanBeSolved.
        isSolvable2 = eq2:isSolvable(dA,dB,dC).
        //then
        Assert:Equals(?,eq1:dX1).
        Assert:Equals(?,eq1:dX2).
        Assert:Equals(?,eq2:dX1).
        Assert:Equals(?,eq2:dX2).
        Assert:isFalse(isSolvable1).
        Assert:isFalse(isSolvable2).        
    end.
    
    @Test.
    method public void detZero():
        //given
        assign dA = 1
               dB = 2
               dC = 1.
        eq1 = new QuadraticEquation(dA,dB,dC).
        eq2 = new QuadraticEquation2().
        //when
        isSolvable1 = eq1:lCanBeSolved.
        isSolvable2 = eq2:isSolvable(dA,dB,dC).
        //then
        Assert:Equals(- 1,eq1:dX1).
        Assert:Equals(- 1,eq1:dX2).
        Assert:Equals(- 1,eq2:dX1).
        Assert:Equals(- 1,eq2:dX2).
        Assert:isTrue(isSolvable1).
        Assert:isTrue(isSolvable2).
    end.
    
    @Test.
    method public void worksWithDecimals():
         //given
        assign dA = 489.45
               dB = 37.11
               dC = -2000.48.
        eq1 = new QuadraticEquation(dA,dB,dC).
        eq2 = new QuadraticEquation2().
        //when
        isSolvable1 = eq1:lCanBeSolved.
        isSolvable2 = eq2:isSolvable(dA,dB,dC).
        //then
        Assert:Equals(1.9841279540703,eq1:dX1).
        Assert:Equals(-2.0599477518025,eq1:dX2).
        Assert:Equals(1.9841279540703,eq2:dX1).
        Assert:Equals(-2.0599477518025,eq2:dX2).
        Assert:isTrue(isSolvable1).
        Assert:isTrue(isSolvable2).
    end.
    
end class.