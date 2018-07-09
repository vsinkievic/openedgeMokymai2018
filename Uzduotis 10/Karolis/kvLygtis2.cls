
using Progress.Lang.*.

block-level on error undo, throw.

class src.kvLygtis2: 
    
    define public property x1 as decimal no-undo 
    
    get.
    set. 
    
    define public property x2 as decimal no-undo 
    
    get.
    set. 
    
    define variable  d as decimal no-undo.
  
    
    
    
    
    method public logical yraSprendiniai (input pA as dec, input pB as dec, input pC as dec):
        
        if (pA = ? or pB = ? or pC = ?) then do:
           message "Neávesti parametrai" view-as alert-box. 
           return false.
        end.
        
        d = pB * pB - (4 * pA * pC).
        
        if d >= 0 then do:
          x1 = (- pB + sqrt(d)) / (2 * pA).
          x2 = (- pB - sqrt(d)) / (2 * pA).
          return true.
        end.
        
         else do:
          x1 = ?.
          x2 = ?.
          return false.
        end.
        
    end method.
    
    

end class.