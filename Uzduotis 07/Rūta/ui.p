
{function.i}

define variable answer as log no-undo.
define variable pA as decimal no-undo.
define variable pB as decimal no-undo.
define variable pC as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.

define frame ui "Iveskite kvadratines lygties koeficientus (a, b, c):" skip(1) pA pB pC.  
    
update pA label "a" pB label "b" pC label "c" with frame ui.

assign answer = solveEquation(pA, pB, pC, output x1, output x2).

if not answer then message "Lygtis neturi sprendiniu" view-as alert-box.
else if x2 = ? then do:
    message "Lygtis turi viena sprendini" view-as alert-box.
    display x1.
end.
else do:
    message "Lygtis turi du sprendinius" view-as alert-box.
    display x1 x2.
end.
