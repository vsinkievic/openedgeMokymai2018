using uzduotis11.keleivis from propath.
using uzduotis11.liftas from propath.
using uzduotis11.pastatas from propath.
using uzduotis11.Ikeleivis from propath.
using uzduotis11.keleivis2 from propath.

define variable liftas1 as class liftas no-undo.
define variable keleivis1 as Ikeleivis no-undo.
define variable keleivis3 as Ikeleivis no-undo.
define variable keleivis4 as Ikeleivis no-undo.
define variable pastatas1 as class pastatas no-undo.
define variable norimasAukstas as integer no-undo.
define variable norimasAukstas1 as integer no-undo.
define button kviestiLifta label "Kviesti lifta kel.1" .
define button keltisLiftu label "Keltis liftu kel.1".
define button kviestiLifta1 label "Kviesti lifta kel.2." .
define button keltisLiftu1 label "Keltis liftu kel.2".
form kviestiLifta keltisLiftu kviestiLifta1 keltisLiftu1 with frame but-frame row 1.
     
pastatas1 = new pastatas().
liftas1 = new liftas(100, pastatas1:aukstuSkaicius).
keleivis1 = new keleivis(80, 1).
keleivis3 = new keleivis2(90, 1).

on choose of kviestiLifta1 do:
    
    display norimasAukstas1 label "Áveskite norimà aukðtà" pastatas1:aukstuSkaicius label "Pastato aukstis"
    liftas1:liftoAukstas label "Lifto aukstas".
    update norimasAukstas1.
    keleivis1:kvieskLifta(liftas1, norimasAukstas1). 
    
end.

on choose of keltisLiftu1 do:
    
    keleivis1:ilipk(liftas1).
    keleivis1:kelkisSuLiftu(liftas1).
    keleivis1:islipk().
    
end.



on choose of kviestiLifta do:
    
    display norimasAukstas label "Áveskite norimà aukðtà" pastatas1:aukstuSkaicius label "Pastato aukstis"
    liftas1:liftoAukstas label "Lifto aukstas".
    update norimasAukstas.
    keleivis3:kvieskLifta(liftas1, norimasAukstas). 
    
end.

on choose of keltisLiftu do:
    
    keleivis3:ilipk(liftas1).
    keleivis3:kelkisSuLiftu(liftas1).
    keleivis3:islipk().
    
end.

enable kviestiLifta keltisLiftu kviestiLifta1 keltisLiftu1 with frame but-frame.
wait-for window-close of current-window.


