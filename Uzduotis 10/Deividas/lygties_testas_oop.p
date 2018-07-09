 
 /*------------------------------------------------------------------------
    File        : lygties_testas_oop.p  
    Syntax      : 
    Author(s)   : Studentas
    Created     : Tue Jul 03 15:00:45 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using KvLygtis.*.
using OpenEdge.Core.Assert from propath.

block-level on error undo, throw.


define variable A as dec no-undo.
define variable B as dec no-undo.
define variable C as dec no-undo.
define variable kvadratine as class KvLygtis no-undo.




/* **********************  Internal Procedures  *********************** */


@Test.
procedure X_EXIST:
//given
A = 2.
B = 1.
C = 3.

//when
kvadratine = NEW KvLygtis(A, B, C).
//then
Assert:isFalse(kvadratine:yraSprendinys).
end procedure.

@Test.
procedure ONE_SOLUTION:
//given
A = 1.
B = 2.
C = 1.

//when
kvadratine = NEW KvLygtis(A, B, C).
//then
Assert:isTrue(kvadratine:yraSprendinys).
Assert:Equals(?,kvadratine:X2).
end procedure.


@Test.
procedure TWO_SOLUTION:
//given
A = 1.
B = 4.
C = 1.

//when
kvadratine = NEW KvLygtis(A, B, C).
//then
Assert:isTrue(kvadratine:yraSprendinys).
end procedure.




@Setup.
procedure setUp:
/*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
------------------------------------------------------------------------------*/

end procedure.  
