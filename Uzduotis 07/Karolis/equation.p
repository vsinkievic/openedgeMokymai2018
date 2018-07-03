{function.i}

define variable A as decimal no-undo.
define variable B as decimal no-undo.
define variable C as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.



define frame kintIvedimas
     a b c
     with side-labels 1 col with title "Áveskite kintamuosius".
     
display a b c with frame kintIvedimas.     
update a b c with frame kintIvedimas.

if solveEquation(A , B, C, x1, x2) then do:
    if (x1 = x2) then do:
        message "Lygties determinantas = 0" view-as alert-box.
        display x1 x2.
    end.
    
    else if (x1 = ? and x2 = ?) then do:
        message "Lygties determinantas < 0" view-as alert-box.
        display x1 x2.
    end.
    
    else do:
        message "Lygties determinantas > 0" view-as alert-box.
        display x1 x2.
    end.           
end.    

else do: message "Lygtis neturi sprendiniu" view-as alert-box.
display x1 x2.
end.
