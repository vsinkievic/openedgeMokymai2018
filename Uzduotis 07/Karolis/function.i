
define variable diskriminantas as decimal no-undo.


function solveEquation returns log (pA as dec, pB as de, pC as dec, output x1 as dec, output x2 as dec):
    
    if (pA = ? or pB = ?) then do:
       message "Neávesti parametrai" view-as alert-box. 
       return false.
    end.
    
diskriminantas = pB * pB - (4 * pA * pC).    

    if diskriminantas >= 0 then do:
        x1 = (- pB - sqrt(diskriminantas)) / 2 * pA.
        x2 = (- pB + sqrt(diskriminantas)) / 2 * pA.
        return true.
    end.
    
    else do:
        x1 = ?.
        x2 = ?.
        return false.
    end.      
    
end function.    