{kvadratines_lygties_skaiciavimai.i}

define variable A as decimal no-undo.
define variable B as decimal no-undo.
define variable C as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.
define variable ats as log no-undo.

define frame ivedimas
    "Iveskite kvadratines lygties AX^2 + BX + C = 0"
    "A , B, ir C reikðmes" skip(1)
    A B C. 
    
    
    
    update A B C
    with frame ivedimas.
    
    ats = solveEquation(A, B, C, x1, x2).
    
    if ats then do:
        if x2 = ? then message "Lygtis turi tik vienà sprendiná, nes D = 0" view-as alert-box.
        display x1 x2.
        
         message "Lygtis turi du sprendinius:" view-as alert-box.
        display x1 x2.
        end.
    else message "Su tokiais duomenimis lygtis neturi sprendiniø" view-as alert-box.
    