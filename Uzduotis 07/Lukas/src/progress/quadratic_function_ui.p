define variable dA as decimal no-undo.
define variable dB as decimal no-undo.
define variable dC as decimal no-undo.
define variable x1 as decimal no-undo.
define variable x2 as decimal no-undo.
define variable equationSolved as log no-undo.

define frame fEquationFrame
   dA label "coef. a" "*x^2" space(3)  dB label "coef. b" "*x" space(3) dC label "coef. c" skip.
    
update dA dB dC with frame fEquationFrame.

{quadratic_function_solution.i}

equationSolved = quadEqSolution(dA, dB, dC, output x1, output x2).

if equationSolved then do: 
    display x1 label "1-as sprendinys" x2 label "2-as sprendinys".
end.
else do:
    message "Lygtis neturi sprendiniø" view-as alert-box.
end.
