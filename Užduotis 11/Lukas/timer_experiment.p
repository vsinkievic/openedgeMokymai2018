define variable i as integer no-undo init 0.

define button mygtukas label "mygtukas".
define frame f mygtukas.
enable mygtukas with frame f.

on choose of mygtukas do:
    message "mygtukas".
end.

do while i < 5:
    i = i + 1.
    message i.
    pause 2.
end.

WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.