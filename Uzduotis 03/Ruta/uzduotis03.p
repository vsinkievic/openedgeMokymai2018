define variable vardas as character no-undo format "x(30)".
define variable count_m as integer no-undo.
define variable count_m_2 as integer no-undo.
define variable count_v as integer no-undo.
define variable count_v_2 as integer no-undo.

input from "duomenys.txt".
output to "vyriski.txt".
repeat:
    import unformatted vardas.
    if substring(vardas, length(vardas)) = "s" then 
    do: 
        export vardas.
        count_v = count_v + 1.
        if index(vardas, " ") <> 0 then 
        do:
            count_v_2 = count_v_2 + 1.
        end.
    end.
end.
output close.
input close.

input from "duomenys.txt".
output to "moteriski.txt".
repeat:
    import unformatted vardas.
    if substring(vardas, length(vardas)) <> "s" then 
    do:
        export vardas.
        count_m = count_m + 1.
        if index(vardas, " ") <> 0 then 
        do:
            count_m_2 = count_m_2 + 1.
        end.
    end.
end.
output close.
input close.

output to "ataskaita.txt".
put unformatted substitute("Vyriğkø vardø: &1; dvigubi: &2; ", count_v, count_v_2).
put unformatted substitute("Moteriğkø vardø: &1; dvigubi: &2.", count_m, count_m_2).
output close.

input from "duomenys.txt".
output to "istaisyta.txt".
repeat:
    import unformatted vardas. 
    if vardas = "Migle" then 
    vardas = "Miglë".
    if vardas = "Sarunas" then 
    vardas = "Ğarûnas".
    export vardas.                 
end.               
output close.                     
input close.
