 
 /*------------------------------------------------------------------------
    File        : quadratic_function
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Mon Jul 09 15:26:45 EEST 2018
    Notes       : Ðis sprendimas yra geresnis, nes lygtis turi visus priklausomus kintamuosius - ir þinomus (a, b, c), ir neþinomus (x1, x2).
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS quadratic_equation:
    
    define public property a as decimal no-undo
        get.
        private set.    
    define public property b as decimal no-undo
        get.
        private set.
    define public property c as decimal no-undo
        get.
        private set.
    define public property x1 as decimal no-undo
        get.
        private set.
    define public property x2 as decimal no-undo
        get.
        private set.
    define public property has_solution as logical no-undo
        get.
        private set.
    
    constructor quadratic_equation (ia as decimal, ib as decimal, ic as decimal):
        a = ia.
        b = ib.
        c = ic.
        has_solution = hassolution().   
    end constructor.       
    
    METHOD PUBLIC LOG hassolution():
        DEFINE VARIABLE D AS DECIMAL NO-UNDO.
        
        IF a = 0 THEN RETURN(FALSE).
        
        D = b * b - 4 * a * c.
        
        IF D > 0 THEN DO:
             x1 = (- b + sqrt(D))/ (2 * a).
             x2 = (- b - sqrt(D))/ (2 * a).
            RETURN(TRUE).
        END.
    
        IF D = 0 THEN DO:
            x1 = - b / (2 * a).
            x2 = ?.
            RETURN(TRUE).
        END.
    
        IF D < 0 THEN DO:
            x1 = ?.
            x2 = ?.
            RETURN(FALSE).
        END.
        
    END METHOD.

END CLASS.