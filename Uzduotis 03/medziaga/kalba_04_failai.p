
define variable eilute as character no-undo.
define variable i as integer no-undo.

input from "kalba_04_failai.p".

repeat:
    i = i + 1.
    import unformatted eilute. 
    message i eilute.   
    display i eilute format "x(60)".
end.

input close.