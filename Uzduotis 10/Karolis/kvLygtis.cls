

using Progress.Lang.*.

block-level on error undo, throw.

class src.kvLygtis: 
    
    

	define public property pA as decimal no-undo
	
	get.
	set.
	
	define public property pB as decimal no-undo
	
    get.
    set.
    
    define public property pC as decimal no-undo
    
    get.
    set.
    
    define public property x1 as decimal no-undo 
    
    get.
    set.
    
    
	define public property x2 as decimal no-undo 
	
    get.
    set. 
    
    define variable  d as decimal no-undo.
 

		

		
	constructor public kvLygtis (input a as dec, input b as dec, input c as dec):
		
		assign 
		   pA = a
		   pB = b
		   pC = c.
		   
	end constructor.

	method public logical yraSprendiniai ():
	    
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