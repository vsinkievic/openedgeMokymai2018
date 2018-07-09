 
 /*------------------------------------------------------------------------
    File        : new_skaiciavimas
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Mon Jul 09 17:57:40 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS new_skaiciavimas: 
    
    define public property x1 as decimal no-undo get.
        private set.
    define public property x2 as decimal no-undo get.
        private set.
    define variable diskriminantas as decimal no-undo.   
    
    method public logical ar_yra (input pA as decimal, input pB as decimal, input pC as decimal):
        diskriminantas = pB * pB - 4 * pA * pC.
        
        if diskriminantas > 0
        then do:
            x1 = ( - pB - sqrt(diskriminantas))/(2 * pA).
            x2 = ( - pB + sqrt(diskriminantas))/(2 * pA).
            return true.
        end.
        
        if diskriminantas = 0 
        then do:
            x1 = ( - pB / (2 * pA)).
            x2 = ?.
            return true.
        end.
        
        if diskriminantas < 0 
        then do:
            return false.
        end.
    end method.

END CLASS.