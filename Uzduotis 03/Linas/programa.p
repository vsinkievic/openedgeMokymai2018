define variable cVardas as character no-undo.
define variable iVyrSk as integer no-undo.
define variable iVyrSkDvg as integer no-undo.
define variable iMotSk as integer no-undo.
define variable iMotSkDvg as integer no-undo.

define variable i as integer no-undo.
define variable v as character no-undo.

define variable taisymai as character no-undo init 
    "Kestutis>Kæstutis;
    Sarune>Ðarûnë;
    Sarlote>Ðarlotë;
    Saule>Saulë;
    Jokubas>Jokûbas;
    Ausra>Auðra;
    Prane>Pranë;
    Giedre>Giedrë;
    Ðarunas>Ðarûnas;
    Prane>Pranë;
    Birute>Birutë;
    Zygimantas>Þygimantas".


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
    
    cVardas = trim(cVardas).
    if cVardas = "" then do:
        next.
    end.
    
    tarpoSumazinimas:
    repeat:
        if index(cVardas, "  ") > 0 then do:
            cVardas = replace(cVardas, "  ", " ").
        end.
        else leave tarpoSumazinimas.
    end.
     
    repeat i = 1 to num-entries(taisymai, ";"):
        v = trim(entry(i, taisymai, ";")).
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
        if cVardas <> "" then do:
            display stream vyr cVardas format "x(25)" no-label.
        end.
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
display "Ið viso vyriðkø vardø: "       format "x(30)"
        iVyrSk                          format ">>9" 
        no-labels skip with stream-io.
display "Tame skaièiuje dvigubø: "      format "x(30)"
        iVyrSkDvg                       format ">>9" 
        no-labels skip with stream-io.
display "Ið viso moteriðkø vardø: "     format "x(30)"
        iMotSk                          format ">>9" 
        no-labels skip with stream-io.
display "Tame skaièiuje dvigubø: "      format "x(30)"
        iMotSkDvg                       format ">>9"  
        no-labels skip with stream-io.
output close.

