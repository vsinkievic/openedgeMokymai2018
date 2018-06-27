define variable id as integer no-undo.
define variable adresas as character no-undo format "x(20)".
define variable miestas as character no-undo.
define variable salis as character no-undo.

input from Adresai.csv.

repeat:
    import delimiter ";" id adresas miestas salis no-error.
    if error-status:error
    then next.
    
    display id adresas miestas salis.
end.
input close.