using uzduotis11.keleivis from propath.
using uzduotis11.liftas from propath.
using uzduotis11.pastatas from propath.

define variable liftas1 as class liftas no-undo.
define variable keleivis1 as class keleivis no-undo.
define variable pastatas1 as class pastatas no-undo.
define variable aukstas as integer no-undo.
define button kviestiLifta label "Kviesti lifta" .
define button rinktisAuksta label "Rinktis auksta".
     form kviestiLifta rinktisAuksta with frame but-frame row 1.
     
pastatas1 = new pastatas().
liftas1 = new liftas(true, 100, false, 5).
keleivis1 = new keleivis("Keleivis pastate", 80, 1).


on choose of kviestiLifta do:
    keleivis1:kvieskLifta().
    liftas1:vaziuokPasKlienta(keleivis1:esamasAukstas).
    liftas1:atidarykDuris().
end.

on choose of rinktisAuksta do:
    keleivis1:ilipk().
    display aukstas pastatas1:aukstuSkaicius label "Pastato aukstis".
    update aukstas.
    if aukstas > pastatas1:aukstuSkaicius
    then message "Nera tiek aukstu".
    else do:
        keleivis1:norimasAukstas = aukstas.
        liftas1:uzdarykDuris().
        if liftas1:arLeistinasSvoris(keleivis1:keleivioSvoris)
        then liftas1:vezkKlienta(keleivis1:norimasAukstas).
         keleivis1:islipk().
    end.
end.

enable kviestiLifta rinktisAUksta with frame but-frame.
wait-for window-close of current-window.


