define variable cVardas as character no-undo.
define variable iVyrSk as integer no-undo.
define variable iVyrSkDvg as integer no-undo.
define variable iMotSk as integer no-undo.
define variable iMotSkDvg as integer no-undo.

define variable i as integer no-undo.
define variable v as character no-undo.

define variable lcTaisymai as longchar  no-undo init 
    "Kestutis>K�stutis;
    Sarune>�ar�n�;
    Sarlote>�arlot�;
    Saule>Saul�;
    Jokubas>Jok�bas;
    Ausra>Au�ra;
    Prane>Pran�;
    Giedre>Giedr�;
    �arunas>�ar�nas;
    Prane>Pran�;
    Birute>Birut�;
    Zygimantas>�ygimantas".


define stream vyr.
define stream mot.
define stream bendras.

input from vardai_nerusiuoti.txt.

output stream vyr to value ("vardai_vyr.txt").
output stream mot to value ("vardai_mot.txt").
output stream bendras to value ("vardai_pataisyti.txt").


sorting:
repeat:
    import unformatted cVardas.
    
 
// VISOKIE PATAISYMAI:
    
    cVardas = trim(cVardas).     //panaikinti tarpus prie� ir po vardo.
    
    if cVardas = "" then do:
        next.   //jeigu eilut� tu��ia, pereiti i� karto prie kitos.
    end.
    
    tarpoSumazinimas:    // jeigu tarp vard� (kai vardas dvigubas) tarp� daugiau negu vienas, suma�inti
    repeat:
        if index(cVardas, "  ") > 0 then do:
            cVardas = replace(cVardas, "  ", " ").
        end.
        else leave tarpoSumazinimas.
    end.
    
    paieskaTaisymuose:
    repeat i = 1 to num-entries(lcTaisymai, ";"):
        v = trim(entry(i, lcTaisymai, ";")).
        if index(cVardas, entry(1, v, ">")) > 0 then do:
            cVardas = replace(cVardas, entry(1, v, ">"), entry(2, v, ">")).
        end.
    end.

display stream bendras cVardas format "x(25)" no-label.


// VYR VARDAI:
    
    if substring(cVardas, length(cVardas), 1) = "s"
    then do:
        iVyrSk = iVyrSk + 1.
        if index(cVardas, " ") > 0 then do:
            iVyrSkDvg = iVyrSkDvg + 1.
        end.
        display stream vyr cVardas format "x(25)" no-label.
    end.

// MOT VARDAI: 
    
    else do:
        iMotSk = iMotSk + 1.
        if index(cVardas, " ") > 0 then do:
            iMotSkDvg = iMotSkDvg + 1.
        end.
        display stream mot cVardas format "x(25)" no-label.
    end.
    
end.

input close.

output stream vyr close.
output stream mot close.
output stream bendras close.


output to 'ataskaita.txt'.
display "I� viso vyri�k� vard�: "       format "x(30)"
        iVyrSk                          format ">>9" 
        no-labels skip with stream-io.
display "Tame skai�iuje dvigub�: "      format "x(30)"
        iVyrSkDvg                       format ">>9" 
        no-labels skip with stream-io.
display "I� viso moteri�k� vard�: "     format "x(30)"
        iMotSk                          format ">>9" 
        no-labels skip with stream-io.
display "Tame skai�iuje dvigub�: "      format "x(30)"
        iMotSkDvg                       format ">>9"  
        no-labels skip with stream-io.
output close.

