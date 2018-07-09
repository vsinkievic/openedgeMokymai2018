

CLASS KvLygtis2:
    define property X1 as decimal no-undo get.
    private set. 
    define property X2 as decimal no-undo get.
    private set.
    
    define variable D as decimal no-undo.
    
  method public logical skaiciuok(input A as dec,input B as dec, input C as dec):
        D = B * B - 4 * A * C.
    
    if D < 0 then do:
         X1 = ?.
         X2 = ?.
         return(false).
         end.
    else if D = 0 then do: 
        X1 = - B / (2 * A).
        X2 = ?.
        return(true).
    end.
    else do:
        X1 = (- B - sqrt(D))/ (2 * A).
        X2 = (- B + sqrt(D))/ (2 * A).
        return(true).
        end.
    end method.

end class.