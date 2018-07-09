class QuadraticEquation: 
    
    define public property dA as decimal no-undo
        get.
        private set.    
    define public property dB as decimal no-undo
        get.
        private set.
    define public property dC as decimal no-undo
        get.
        private set.
    define public property dX1 as decimal no-undo
        get.
        private set.
    define public property dX2 as decimal no-undo
        get.
        private set.
    define public property lCanBeSolved as logical no-undo
        get.
        private set.
    
    constructor QuadraticEquation (pdA as decimal, pdB as decimal, pdC as decimal):
        dA = pdA.
        dB = pdB.
        dC = pdC.
        lCanBeSolved = isSolvable().   
    end constructor.
    
    method private log isSolvable():
        define variable det as decimal no-undo.
   
        det = dB * dB - 4 * dA * dC.
        if dA = 0 or det < 0 then do:
            assign dX1 = ?
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