function solveEquation return log(pA as dec, pB as dec, pC as dec,
                                    output x1 as dec, output x2 as dec):   
    define variable det as decimal no-undo.
   
    det = pB * pB - 4 * pA * pC.
    if pA = 0 or det < 0 then do:
        assign x1 = ?
               x2 = ?.
        return false.
    end. 
    else if det > 0  then do:
        x1 = (- pB + sqrt(det)) / (2 * pA).
        x2 = (- pB - sqrt(det)) / (2 * pA).
        return true.
    end.
    else do:
        x1 = (- pB) / (2 * pA).
        x2 = x1.
        return true.
    end.                               
end function.