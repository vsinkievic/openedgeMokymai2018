
/*------------------------------------------------------------------------
    File        : calc_linenar_gr.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Tue Jul 03 17:28:27 EEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

DEFINE VARIABLE D AS DECIMAL NO-UNDO.

/* ***************************    Function   ************************** */

FUNCTION solveQuadraticEquation RETURNS LOG (INPUT pA AS DECIMAL, INPUT pB AS DECIMAL, INPUT pC AS DECIMAL, OUTPUT x1 AS DECIMAL, OUTPUT x2 AS DECIMAL):
    
    D = pB * pB - 4 * pA * pC.
    IF D > 0 THEN DO:
        x1 = (- pB + sqrt(D))/ (2 * pA).
        x2 = (- pB - sqrt(D))/ (2 * pA).
        RETURN(TRUE).
    END.
    
    IF D = 0 THEN DO:
        x1 = - pB / (2 * pA).
        x2 = ?.
        RETURN(TRUE).
    END.
    
    IF D  < 0 THEN DO:
        x1 = ?.
        x2 = ?.
        RETURN(FALSE).
    END.
    
END FUNCTION.
