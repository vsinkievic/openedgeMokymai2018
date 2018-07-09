class QuadraticEquation2: 
    
     define public property dX1 as decimal no-undo
        get.
        private set.
    define public property dX2 as decimal no-undo
        get.
        private set.
        
    method public log isSolvable(dA as decimal, dB as decimal, dC as decimal):
        define variable det as decimal no-undo.
        define variable x1 as decimal no-undo.
        define variable x2 as decimal no-undo.
   
        det = dB * dB - 4 * dA * dC.
        if dA = 0 or det < 0 then do:
            dX1 = ?.
            dX2 = ?.
            return false.
        end. 
        else if det >= 0  then do:
            dX1 = (- dB + sqrt(det)) / (2 * dA).
            dX2 = (- dB - sqrt(det)) / (2 * dA).
            return true.
        end.                   
    end.
    
end class.