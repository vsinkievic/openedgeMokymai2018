 
 /*------------------------------------------------------------------------
    File        : skaiciavimas
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Mon Jul 09 14:13:43 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

class skaiciavimas: 

    define property x1 as decimal get.
        private set.
    define property x2 as decimal get.
        private set.
    define variable diskriminantas as decimal no-undo.
    define property ar_yra as logical get.
        private set.
    
    constructor public skaiciavimas (input pA as decimal, input pB as decimal, input pC as decimal):
       diskriminantas = pB * pB - 4 * pA * pC.
        
        if diskriminantas > 0
        then do:
            x1 = ( - pB - sqrt(diskriminantas))/(2 * pA).
            x2 = ( - pB + sqrt(diskriminantas))/(2 * pA).
            ar_yra = true.
        end.
        
        if diskriminantas = 0 
        then do:
            x1 = ( - pB / (2 * pA)).
            x2 = ?.
            ar_yra = true.
        end.
        
        if diskriminantas < 0 
        then do:
            ar_yra = false.
        end.
    end constructor.
end class.