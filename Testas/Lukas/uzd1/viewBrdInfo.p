define variable months as character no-undo extent 12 format "x(15)"
    init ["Sausis", "Vasaris", "Kovas", "Balandis", "Geguþë", "Birþelis", 
          "Liepa", "Rugpjûtis", "Rugsëjis", "Spalis", "Lapkritis", "Gruodis"].

define variable days as character no-undo extent 7 format "x(15)"
    init ["Pirmadienis", "Antradienis", "Treèiadienis", "Ketvirtadienis", 
          "Penktadienis", "Ðeðtadienis", "Sekmadienis"].
          
define variable iDay as integer no-undo.
define variable iMonth as integer no-undo.
define variable iYear as integer no-undo.
define variable birthDate as date no-undo.
define variable currentDate as date no-undo.

update iYear label "Metai" help "Áveskite gimimo metus".
update iMonth label "Mënuo" help "Áveskite gimimo mënesá".
update iDay label "Diena" help "Áveskite gimimo dienà".

birthDate = date(iMonth, iDay, iYear).
currentDate = today.

message iYear "-" months[iMonth] "-" iDay skip
        "Pragyventa dienø:" currentDate - birthDate skip
        "Gimë savaitës dienà:" days[weekday(birthDate)]
        view-as alert-box title "Informacija".


    
          