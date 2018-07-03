 
 /*------------------------------------------------------------------------
    File        : saknies_testas.p 
    Syntax      : 
    Author(s)   : Studentas
    Created     : Tue Jul 03 15:00:56 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING OpenEdge.Core.Assert FROM PROPATH.

BLOCK-LEVEL ON ERROR UNDO, THROW.

define variable a as decimal no-undo.
define variable b as decimal no-undo.
define variable c as decimal no-undo.
define variable determinant as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.

define variable answer as log no-undo.

{solution.i}

@Test.
PROCEDURE functionWorks:
    // given
        a = 1.
        b = 2.
        c = 1.
    
    //when
        answer = solution(a, b, c, x1, x2).
    
    //then
        Assert:equals(-1, x1).

END PROCEDURE.  

@Test.
PROCEDURE determinantZero:
    // given
        a = 2.
        b = 4.
        c = 2.
    
    //when
        answer = solution(a, b, c, x1, x2).
    
    //then
        Assert:isTrue(x1 = -4 and x2 = ?).
        
END PROCEDURE.  

@Test.
PROCEDURE determinantNegativeGivesFalse:
    // given
        a = 2.
        b = 1.
        c = 2.
    
    //when
        answer = solution(a, b, c, x1, x2).
    
    //then
        Assert:isFalse(answer).
        
END PROCEDURE.  

@Test.
PROCEDURE determinantNegativeGivesNullOutputs:
    // given
        a = 2.
        b = 1.
        c = 2.
    
    //when
        answer = solution(a, b, c, x1, x2).
    
    //then
        Assert:Equals(?, x1).
        Assert:Equals(?, x2).
        
END PROCEDURE.  

