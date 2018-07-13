define variable months as character no-undo extent 12 format "x(15)"
    init ["Sausis", "Vasaris", "Kovas", "Balandis", "Gegu��", "Bir�elis", 
          "Liepa", "Rugpj�tis", "Rugs�jis", "Spalis", "Lapkritis", "Gruodis"].

define variable days as character no-undo extent 7 format "x(15)"
    init ["Pirmadienis", "Antradienis", "Tre�iadienis", "Ketvirtadienis", 
          "Penktadienis", "�e�tadienis", "Sekmadienis"].
          
define variable iDay as integer no-undo.
define variable iMonth as integer no-undo.
define variable iYear as integer no-undo.
define variable birthDate as date no-undo.
define variable currentDate as date no-undo.

update iYear label "Metai" help "�veskite gimimo metus".
update iMonth label "M�nuo" help "�veskite gimimo m�nes�".
update iDay label "Diena" help "�veskite gimimo dien�".

birthDate = date(iMonth, iDay, iYear).
currentDate = today.

message iYear "-" months[iMonth] "-" iDay skip
        "Pragyventa dien�:" currentDate - birthDate skip
        "Gim� savait�s dien�:" days[weekday(birthDate)]
        view-as alert-box title "Informacija".


    
          