
/*------------------------------------------------------------------------
    File        : create.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : PauliusKu
    Created     : Thu Jul 12 16:27:56 EEST 2018
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

DEFINE FRAME f1 SKIP cName SKIP cPhone SKIP cCountry SKIP cAdress WITH 1 COL CENTERED.

/* ***************************  Main Block  *************************** */

UPDATE cName cPhone cCountry cAdress WITH FRAME f1.

TEMP-TABLE ttCustomer:TRACKING-CHANGES = TRUE.

FIND LAST ttCustomer.
CNumber = ttCustomer.CustNum + 1.

CREATE ttCustomer.

ASSIGN 
    ttCustomer.custnum = CNumber
    ttCustomer.name = cName
    ttCustomer.country = cCountry
    ttCustomer.Address = cAdress
    ttCustomer.phone = cPhone.
    
DISPLAY CNumber SKIP cCountry SKIP cName SKIP cPhone WITH FRAME f1 TITLE "Kliento kurimas". 
    
CATCH e AS Progress.Lang.Error :
    UNDO, THROW NEW AppError("Klaida kuriant klienta!",0).
END.

FINALLY: 
    TEMP-TABLE ttCustomer:TRACKING-CHANGES = FALSE.
    HIDE FRAME f1.
END.