

CLASS KvLygtis:
    define property A as dec no-undo get.
    define property B as dec no-undo get.
    define property C as dec no-undo get.
    define property X1 as decimal no-undo get.
    private set. 
    define property X2 as decimal no-undo get.
    private set.
    define property yraSprendinys as logical no-undo get.
    private set.
    
    define variable D as decimal no-undo.
    
    constructor  KvLygtis(input A as dec,input B as dec, input C as dec):
        D = B * B - 4 * A * C.
    
    if D < 0 then do:
         X1 = ?.
         X2 = ?.
         yraSprendinys = false.
         end.
    else if D = 0 then do: 
        X1 = - B / (2 * A).
        X2 = ?.
        yraSprendinys = true.
    end.
    else do:
        X1 = (- B - sqrt(D))/ (2 * A).
        X2 = (- B + sqrt(D))/ (2 * A).
        yraSprendinys = true.
        end.
    end constructor.

end class.