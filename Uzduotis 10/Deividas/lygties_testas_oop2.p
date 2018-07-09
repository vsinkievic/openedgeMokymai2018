 
 /*------------------------------------------------------------------------
    File        : lygties_testas_oop2.p 
    Syntax      : 
    Author(s)   : Studentas
    Created     : Mon Jul 09 16:26:36 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using KvLygtis2.*.
using OpenEdge.Core.Assert from propath.

block-level on error undo, throw.


define variable A as decimal  no-undo.
define variable B as decimal  no-undo.
define variable C as decimal  no-undo.
define variable kvadratine as class KvLygtis2 no-undo.




/* **********************  Internal Procedures  *********************** */


@Test.
procedure X_EXIST:
//given
A = 2.
B = 1.
C = 3.

//when
kvadratine = NEW KvLygtis2().
//then
Assert:isFalse(kvadratine:skaiciuok(A, B, C)).
end procedure.

@Test.
procedure ONE_SOLUTION:
//given
A = 1.
B = 2.
C = 1.

//when
kvadratine = NEW KvLygtis2().
//then
Assert:isTrue(kvadratine:skaiciuok(A, B, C)).
Assert:Equals(?,kvadratine:X2).
end procedure.


@Test.
procedure TWO_SOLUTION:
//given
A = 1.
B = 4.
C = 1.

//when
kvadratine = NEW KvLygtis2().
//then
Assert:isTrue(kvadratine:skaiciuok(A, B, C)).
end procedure.




@Setup.
procedure setUp:
/*------------------------------------------------------------------------------
        Purpose:                                                                      
        Notes:                                                                        
------------------------------------------------------------------------------*/

end procedure.  
