define variable d as decimal no-undo.


function solution returns log (input a as decimal, input b as decimal, 
        input c as decimal, output x1 as decimal, output x2 as decimal):
    
    

    d = b * b - 4 * a * c.
    
    if d < 0 or a = 0 then do:
        x1 = ?.
        x2 = ?.
        return false.
    end.
    else if d > 0 then do:
        x1 = (- b + sqrt(d)) / 2 * a.
        x2 = (- b - sqrt(d)) / 2 * a.
        return true.
    end.
    else 
        x1 = (- b) / 2 * a.
        x2 = ?.
        return true.
    
end.
    
