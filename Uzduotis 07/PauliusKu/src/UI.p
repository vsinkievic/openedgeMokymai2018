
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

DEFINE VARIABLE a as DECIMAL NO-UNDO.
DEFINE VARIABLE b as DECIMAL NO-UNDO.
DEFINE VARIABLE c as DECIMAL NO-UNDO.
DEFINE VARIABLE x1 as DECIMAL NO-UNDO.
DEFINE VARIABLE x2 as DECIMAL NO-UNDO.

DEFINE VARIABLE answ AS LOGICAL NO-UNDO.

/* ***************************  Main Block  *************************** */


UPDATE a b c HELP "Įveskite A B C".


{src/calc_linenar_gr.i}

answ = solveQuadraticEquation(a, b, c, x1, x2).

IF NOT answ THEN MESSAGE "Sprendinių nėra" VIEW-AS ALERT-BOX.

HIDE ALL.
DISPLAY x1 x2.