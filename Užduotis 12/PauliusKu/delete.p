
/*------------------------------------------------------------------------
    File        : delete.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : PauliusKu
    Created     : Thu Jul 12 16:27:32 EEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Progress.Lang.AppError FROM PROPATH.

{dataset.i}

DEFINE INPUT-OUTPUT PARAMETER DATASET FOR dsCustomer.

DEFINE VARIABLE iNumber AS INTEGER  NO-UNDO LABEL "Kliento nr." FORMAT ">>>>>>>>>>".
DEFINE FRAME fr 
            iNumber WITH CENTERED.

/* ***************************  Main Block  *************************** */
TEMP-TABLE ttCustomer:TRACKING-CHANGES = TRUE.

UPDATE iNumber WITH FRAME fr.

FIND FIRST ttCustomer WHERE ttCustomer.CustNum = iNumber.
DELETE ttCustomer.
    
DISPLAY iNumber WITH FRAME fr TITLE "Kliento trinimas". 
    
CATCH e AS Progress.Lang.Error :
    UNDO, THROW NEW AppError("Kalida trinant klineta! Turbut nera klineto su tokiu numeriu",0).
END.

FINALLY:
    TEMP-TABLE ttCustomer:TRACKING-CHANGES = FALSE.
    HIDE FRAME fr.
END.