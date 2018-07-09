 
 /*------------------------------------------------------------------------
    File        : test.p 
    Syntax      : 
    Author(s)   : Studentas
    Created     : Mon Jul 09 20:03:56 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING skaiciavimas.*.
USING new_skaiciavimas.*.
USING OpenEdge.Core.Assert from propath.

define variable rezultatai as class skaiciavimas no-undo.
//define variable new_rezultatai as class new_skaiciavimas no-undo.
define variable pirmas as decimal no-undo.
define variable antras as decimal no-undo.
define variable trecias as decimal no-undo.

//BLOCK-LEVEL ON ERROR UNDO, THROW. 
//--------------------------------------------------------------------------//

@Test.
procedure ar_x1_yra_minus1:
    
//given
pirmas = 1.
antras = 2.
trecias = 1.

//when
rezultatai = new skaiciavimas (pirmas, antras, trecias).

//then
Assert:Equals(-1,rezultatai:x1).
end procedure.

//--------------------------------------------------------------------------//

@Test.
procedure ar_vienas_spr:
    
//given
pirmas = 1.
antras = 2.
trecias = 1.

//when
rezultatai = new skaiciavimas (pirmas, antras, trecias).

//then
Assert:Equals(?,rezultatai:x2).
end procedure.

//--------------------------------------------------------------------------//

@Test.
procedure ar_du_spr:
    
//given
pirmas = 1.
antras = 5.
trecias = 1.

//when
rezultatai = new skaiciavimas (pirmas, antras, trecias).

//then
Assert:isTrue(rezultatai:ar_yra).
end procedure.

//--------------------------------------------------------------------------//

@Test.
procedure ar_neneigiamas:
    
//given
pirmas = 1.
antras = 2.
trecias = 30.

//when
rezultatai = new skaiciavimas (pirmas, antras, trecias).

//then
Assert:isFalse(rezultatai:ar_yra).
end procedure.
