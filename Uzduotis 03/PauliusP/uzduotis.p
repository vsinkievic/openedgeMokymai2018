define variable Vardas as character no-undo.
define variable paskutineRaide as character no-undo.
define variable vyriskiVardai as integer no-undo init 0.
define variable moteriskiVardai as integer no-undo init 0.
define variable vyriskiDvigubi as integer no-undo init 0.
define variable moteriskiDvigubi as integer no-undo init 0.
 
//Vykdziau vardu skaiciavima, juos rusiavau, vyriskus vardus surasiau i faila 
input from "vardaiBendras.txt".
output to "vyriskiVardai.txt" convert target "utf-8".
repeat:
    import unformatted vardas.
    paskutineRaide = substr(vardas,length(vardas)).
    
if paskutineRaide = "s"
then do:  
    if index(vardas, " ") = 0   
        then do:
            vyriskiVardai = vyriskiVardai + 1.
            export vardas.
        end.
        else do: 
            vyriskiDvigubi = vyriskiDvigubi + 1.
            export vardas.
        end.
end.
else do:
   if index(vardas, " ") = 0
       then do:
            moteriskiVardai = moteriskiVardai + 1.
       end.
       else do:
            moteriskiDvigubi = moteriskiDvigubi + 1 .
       end.
end.
end.
input close.
output close.

//Moterisku vardu surasymas i faila.
input from "vardaiBendras.txt".
output to "moteriskiVardai.txt" convert target "utf-8".
repeat:
    import unformatted vardas.
    paskutineRaide = substr(vardas,length(vardas)).
    if paskutineRaide <> "s"
    then do:
        export vardas.
    end.   
end.
input close.
output close.

//Klaidu taisymas.
input from "vardaiBendras.txt".
output to "pataisytiVardai.txt".
repeat:
    import unformatted vardas.
    if vardas = "Ruta"  then vardas = "Rûta".
    if vardas = "Juste"  then vardas = "Justë".
    if vardas = "Migle"  then vardas = "Miglë".
    if vardas = "Indre"  then vardas = "Indrë".
    if vardas = "Nijole"  then vardas = "Nijolë".
    export vardas.
end.
input close.
output close.

//Ataskaitos sugeneravimas.
output to "ataskaita.txt" convert target "utf-8".
   display vyriskiVardai moteriskiVardai vyriskiDvigubi moteriskiDvigubi.
output close. 