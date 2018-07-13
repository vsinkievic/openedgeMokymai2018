define variable dtGimDiena as date no-undo.
define variable iMenuo as integer no-undo.
define variable cMenuo as character no-undo.
define variable i as integer no-undo.
define variable iDienuSk as integer no-undo.
define variable iSavDiena as integer no-undo.
define variable cSavDiena as character no-undo.

define variable lcMenesiai as longchar init 
    "sausis,vasaris,kovas,balandis,geguþë,birþelis,
    liepa,rugpjûtis,rugsëjis,spalis,lapkritis,gruodis" no-undo.
define variable lcDienos as longchar init "pirmadienis,antradienis,treèiadienis,
    ketvirtadienis,penktadienis,ðeðtadienis,sekmadienis" no-undo.

update dtGimDiena.

iMenuo = month(dtGimDiena).

cMenuo = entry(iMenuo, lcMenesiai, ",").


iDienuSk = interval(date(now), dtGimDiena, 'days').


iSavDiena = weekday(dtGimDiena).

cSavDiena = entry(iSavDiena, lcDienos, ',').

message substitute("Pragyventø dienø skaièius: &1", iDienuSk) skip
        substitute("Jûsø gimimo diena: &1 m. &2, &3 d.", year(dtGimDiena), cMenuo, day(dtGimDiena)) skip
        substitute("Jûsø gimimo dienos savaitës diena yra &1", cSavDiena) view-as alert-box.









