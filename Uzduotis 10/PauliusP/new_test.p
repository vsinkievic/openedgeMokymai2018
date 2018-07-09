 
 /*------------------------------------------------------------------------
    File        : new_test.p 
    Syntax      : 
    Author(s)   : Studentas
    Created     : Mon Jul 09 21:01:33 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING skaiciavimas.*.
USING new_skaiciavimas.*.
USING OpenEdge.Core.Assert from propath.

//define variable rezultatai as class skaiciavimas no-undo.
define variable new_rezultatai as class new_skaiciavimas no-undo.
define variable pirmas as decimal no-undo.
define variable antras as decimal no-undo.
define variable trecias as decimal no-undo.

//BLOCK-LEVEL ON ERROR UNDO, THROW. 
//--------------------------------------------------------------------------//

@Test.
procedure ar_du_spr:
    
//given
pirmas = 1.
antras = 9.
trecias = 1.

//when
new_rezultatai = new new_skaiciavimas().

//then
Assert:isTrue(new_rezultatai:ar_yra(pirmas,antras,trecias)).
end procedure.

//--------------------------------------------------------------------------//

@Test.
procedure ar_vienas_spr:
    
//given
pirmas = 1.
antras = 2.
trecias = 1.

//when
new_rezultatai = new new_skaiciavimas().

//then
Assert:equals(?,new_rezultatai:x2).
end procedure.

//--------------------------------------------------------------------------//

@Test.
procedure ar_neneigiamas:
    
//given
pirmas = 1.
antras = 2.
trecias = 30.

//when
 new_rezultatai = new new_skaiciavimas ().

//then
Assert:isFalse(new_rezultatai:ar_yra(pirmas,antras,trecias)).
end procedure.