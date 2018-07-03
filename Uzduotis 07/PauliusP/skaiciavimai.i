define variable diskriminantas as integer no-undo.

function solveEquation returns log (input pA as decimal, input pB as decimal, input pC as decimal, output x1 as decimal, output x2 as decimal):
    diskriminantas = pB * pB - 4 * pA * pC.
    if diskriminantas > 0
        then do:
            x1 = ( - pB - sqrt(diskriminantas))/(2 * pA).
            x2 = ( - pB + sqrt(diskriminantas))/(2 * pA).
            return(true).
    end.
    if diskriminantas = 0 
        then do:
            x1 = ( - pB / (2 * pA)).
            x2 = ?.
            return(true).
        end.
end function.