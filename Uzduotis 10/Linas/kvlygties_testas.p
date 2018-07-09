 
 /*------------------------------------------------------------------------
    File        : saknies_testas.p 
    Syntax      : 
    Author(s)   : Studentas
    Created     : Tue Jul 03 15:00:56 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING OpenEdge.Core.Assert FROM PROPATH.
using kLygtis.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

define variable a as decimal no-undo.
define variable b as decimal no-undo.
define variable c as decimal no-undo.
define variable determinant as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.
define variable kv as class kLygtis no-undo.



@Test.
PROCEDURE functionWorks:
    // given
        a = 1.
        b = 2.
        c = 1.
    
    //when
        kv = new kLygtis(a, b, c).
    
    //then
        Assert:equals(-1, kv:x1).
        Assert:equals(0, kv:det()).

END PROCEDURE.  

@Test.
PROCEDURE determinantZero:
    // given
        a = 2.
        b = 4.
        c = 2.
    
    //when
        kv = new kLygtis(a, b, c).
    
    //then
        Assert:isTrue(kv:x1 = -4 and kv:x2 = ?).
        
END PROCEDURE.  

@Test.
PROCEDURE determinantNegativeGivesFalse:
    // given
        a = 2.
        b = 1.
        c = 2.
    
    //when
        kv = new kLygtis(a, b, c).
    
    //then
        Assert:isFalse(kv:sprestina()).
        
END PROCEDURE.  

@Test.
PROCEDURE determinantNegativeGivesNullOutputs:
    // given
        a = 2.
        b = 1.
        c = 2.
    
    //when
        kv = new kLygtis(a, b, c).
    
    //then
        Assert:Equals(?, kv:x1).
        Assert:Equals(?, kv:x2).
        
END PROCEDURE.  

