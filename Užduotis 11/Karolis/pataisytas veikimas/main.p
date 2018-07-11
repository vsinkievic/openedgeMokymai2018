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
define variable aukstas as integer no-undo.
define button kviestiLifta label "Kviesti lifta" .
define button keltisLiftu label "Keltis liftu".
form kviestiLifta keltisLiftu with frame but-frame row 1.
     
pastatas1 = new pastatas().
liftas1 = new liftas(100, pastatas1:aukstuSkaicius).
keleivis1 = new keleivis(80, 1).
keleivis3 = new keleivis2(110, 1).



on choose of kviestiLifta do:
    
    display aukstas label "Áveskite norimà aukðtà" pastatas1:aukstuSkaicius label "Pastato aukstis".
    update aukstas.
    keleivis3:kvieskLifta(liftas1, aukstas). 
    
end.

on choose of keltisLiftu do:
    
    keleivis3:ilipk(liftas1).
    keleivis3:kelkisSuLiftu(liftas1).
    keleivis3:islipk().
    
end.

enable kviestiLifta keltisLiftu with frame but-frame.
wait-for window-close of current-window.


