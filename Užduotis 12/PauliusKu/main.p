
/*------------------------------------------------------------------------
    File        : main.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : PauliusKu
    Created     : Thu Jul 12 16:22:04 EEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

{DataSet.i}

DEFINE BUTTON bCreate LABEL "Kurti".
DEFINE BUTTON bUpdate LABEL "Keisti".
DEFINE BUTTON bDelete LABEL "Trinti".

DEFINE FRAME fr
       bCreate bDelete bUpdate WITH CENTERED.

DEFINE  DATA-SOURCE srccustomer FOR Customer.
BUFFER ttcustomer:ATTACH-DATA-SOURCE(DATA-SOURCE srccustomer:HANDLE).
DATASET dsCustomer:FILL().

ON CHOOSE OF bCreate DO:
    DISABLE bCreate bDelete bUpdate WITH FRAME fr.
    RUN CREATE(INPUT-OUTPUT DATASET dsCustomer).
    {buffer-error.i}
END.

ON CHOOSE OF bUpdate DO:
    DISABLE bCreate bDelete bUpdate WITH FRAME fr.
    RUN UPDATE(INPUT-OUTPUT DATASET dsCustomer).
    {buffer-error.i}
END.

ON CHOOSE OF bDelete DO:
    DISABLE bCreate bDelete bUpdate WITH FRAME fr.
    RUN DELETE(INPUT-OUTPUT DATASET dsCustomer).
    {buffer-error.i}
END.


ENABLE bCreate bDelete bUpdate WITH FRAME fr.
WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.