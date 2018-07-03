
define variable d as decimal no-undo.

function solveEquation returns log (input pA as dec,input pB as dec,input pC as dec, output x1 as dec, output x2 as dec):
    d = pB * pB - 4 * pA * pC.
    if D < 0 then do:
         assign x1 = ? x2 = ?.
         return false.
    end.
    else if d = 0 then do:
        x1 = (- pB) / (2 * pA).
        x2 = ?.
        return true.
    end.
    else do:
        x1 = (- pB + sqrt(d)) / (2 * pA).
        x2 = (- pB - sqrt(d)) / (2 * pA).
        return true.
    end.
end function.