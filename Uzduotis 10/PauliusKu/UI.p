
/*------------------------------------------------------------------------
    File        : UI.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : PauliusKu
    Created     : Tue Jul 03 17:28:56 EEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

DEFINE VARIABLE a AS DECIMAL NO-UNDO.
DEFINE VARIABLE b AS DECIMAL NO-UNDO.
DEFINE VARIABLE c AS DECIMAL NO-UNDO.
DEFINE VARIABLE x1 AS DECIMAL NO-UNDO.
DEFINE VARIABLE x2 AS DECIMAL NO-UNDO.
DEFINE VARIABLE q-equation AS quadratic_equation NO-UNDO.

/* ***************************  Main Block  *************************** */

UPDATE a b c HELP "Áveskite A B C".

q-equation = NEW quadratic_equation(a, b, c).

IF q-equation:hassolution() THEN DO:
    
    HIDE ALL.
    DISPLAY q-equation:x1 q-equation:x2.
END.
ELSE MESSAGE "Sprendiniø nëra arba klaidingi ávesties parametrai" VIEW-AS ALERT-BOX.