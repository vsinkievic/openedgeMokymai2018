define variable dtGimDiena as date no-undo.
define variable iMenuo as integer no-undo.
define variable cMenuo as character no-undo.
define variable i as integer no-undo.
define variable iDienuSk as integer no-undo.
define variable iSavDiena as integer no-undo.
define variable cSavDiena as character no-undo.

define variable lcMenesiai as longchar init 
    "sausis,vasaris,kovas,balandis,gegu��,bir�elis,
    liepa,rugpj�tis,rugs�jis,spalis,lapkritis,gruodis" no-undo.
define variable lcDienos as longchar init "pirmadienis,antradienis,tre�iadienis,
    ketvirtadienis,penktadienis,�e�tadienis,sekmadienis" no-undo.

update dtGimDiena.

iMenuo = month(dtGimDiena).

cMenuo = entry(iMenuo, lcMenesiai, ",").


iDienuSk = interval(date(now), dtGimDiena, 'days').


iSavDiena = weekday(dtGimDiena).

cSavDiena = entry(iSavDiena, lcDienos, ',').

message substitute("Pragyvent� dien� skai�ius: &1", iDienuSk) skip
        substitute("J�s� gimimo diena: &1 m. &2, &3 d.", year(dtGimDiena), cMenuo, day(dtGimDiena)) skip
        substitute("J�s� gimimo dienos savait�s diena yra &1", cSavDiena) view-as alert-box.









