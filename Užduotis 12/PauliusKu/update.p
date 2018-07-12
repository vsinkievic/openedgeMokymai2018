
/*------------------------------------------------------------------------
    File        : update.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : PauliusKu
    Created     : Thu Jul 12 16:27:44 EEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */
USING Progress.Lang.AppError FROM PROPATH.
BLOCK-LEVEL ON ERROR UNDO, THROW.

{dataset.i}

DEFINE INPUT-OUTPUT PARAMETER DATASET FOR dsCustomer.

DEFINE VARIABLE CNumber AS INTEGER NO-UNDO LABEL "Numeris" FORMAT ">>>>>>>>>>".
DEFINE VARIABLE cCountry AS CHARACTER NO-UNDO LABEL "Vlastybe" FORMAT "x(25)".
DEFINE VARIABLE cAdress AS CHARACTER NO-UNDO LABEL "Adresas" FORMAT "x(25)".
DEFINE VARIABLE cName AS CHARACTER NO-UNDO LABEL "Vardas" FORMAT "x(25)".
DEFINE VARIABLE cPhone AS CHARACTER NO-UNDO LABEL "Tel. nr." FORMAT "x(25)".

DEFINE FRAME f1 ttCustomer.Name SKIP ttCustomer.Country SKIP ttCustomer.Address SKIP ttCustomer.Phone SKIP WITH 1 COL CENTERED.
DEFINE FRAME f2 CNumber WITH 1 COL CENTERED.

/* ***************************  Main Block  *************************** */

UPDATE Cnumber WITH FRAME f2.

TEMP-TABLE ttCustomer:TRACKING-CHANGES = TRUE.

FIND FIRST ttCustomer WHERE ttCustomer.CustNum = CNumber.
UPDATE ttCustomer.Name ttCustomer.Country ttCustomer.Address ttCustomer.Phone WITH FRAME f1.

DISPLAY ttCustomer.Name ttCustomer.Country ttCustomer.Address ttCustomer.Phone WITH FRAME f1 TITLE "Klineto duomenu keitimas".
    
CATCH e AS Progress.Lang.Error :
    UNDO, THROW NEW AppError("Klaida keiciant kliento duomenys! Turbut nera klineto su tokiu numeriu",0).
END.

FINALLY: 
    TEMP-TABLE ttCustomer:TRACKING-CHANGES = FALSE.
    HIDE FRAME f1 FRAME f2.
END.