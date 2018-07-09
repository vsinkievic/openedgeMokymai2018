using Progress.Lang.*.
using OpenEdge.Core.Assert from propath.

block-level on error undo, throw.

class test:
    
    define variable pA as decimal no-undo.
    define variable pB as decimal no-undo.
    define variable pC as decimal no-undo.
    define variable hasSolution1 as log no-undo.
    define variable hasSolution2 as log no-undo.
    define variable eqSolver1 as class qEquation1 no-undo.
    define variable eqSolver2 as class qEquation2 no-undo.
    
    @Test.
    method public void determinantIsZero():
        //given
        assign pA = 2 pB = 4 pC = 2.
        eqSolver1 = new qEquation1(pA, pB, pC).
        eqSolver2 = new qEquation2().
        //when
        hasSolution1 = eqSolver1:isSolvable.
        hasSolution2 = eqSolver2:hasSolution(pA, pB, pC).
        //then
        Assert:Equals(-1, eqSolver1:x1).
        Assert:Equals(-1, eqSolver1:x2).
        Assert:isTrue(hasSolution1).
        Assert:Equals(-1, eqSolver2:x1).
        Assert:Equals(-1, eqSolver2:x2).
        Assert:isTrue(hasSolution2).
    end.
    
    @Test.
    method public void determinantIsNegative():
        //given
        assign pA = 4 pB = 2 pC = 4.
        eqSolver1 = new qEquation1(pA, pB, pC).
        eqSolver2 = new qEquation2().
        //when
        hasSolution1 = eqSolver1:isSolvable.
        hasSolution2 = eqSolver2:hasSolution(pA, pB, pC).
        //then
        Assert:Equals(?, eqSolver1:x1).
        Assert:Equals(?, eqSolver1:x2).
        Assert:isFalse(hasSolution1).
        Assert:Equals(?, eqSolver2:x1).
        Assert:Equals(?, eqSolver2:x2).
        Assert:isFalse(hasSolution2).        
    end.
    
    @Test.
    method public void inputIsZero():
        //given
        assign pA = 0 pB = 0 pC = 0.
        eqSolver1 = new qEquation1(pA, pB, pC).
        eqSolver2 = new qEquation2().
        //when
        hasSolution1 = eqSolver1:isSolvable.
        hasSolution2 = eqSolver2:hasSolution(pA, pB, pC).
        //then
        Assert:Equals(?, eqSolver1:x1).
        Assert:Equals(?, eqSolver1:x2).
        Assert:isFalse(hasSolution1).
        Assert:Equals(?, eqSolver2:x1).
        Assert:Equals(?, eqSolver2:x2).
        Assert:isFalse(hasSolution2).
    end.
    
end class.