//nespėjau
DEFINE VARIABLE cname AS CHARACTER NO-UNDO.

DEFINE QUERY q-customer FOR customer.

DEFINE BROWSE b-customer QUERY q-customer NO-LOCK DISPLAY Customer.Name Customer.Balance
        WITH 100 DOWN NO-ASSIGN SEPARATORS.

DEFINE FRAME f-main
             b-customer
            WITH 1 COL TITLE "Klientai" center.

DEFINE FRAME fr
       cname WITH CENTERED.

ON "Ctrl-n" OF b-customer DO:  
    
END.

UPDATE cname WITH FRAME fr.

open query q-customer 
    for each customer no-lock . //where customer.name MATCHES(cname).
browse b-customer:refresh() no-error.

ENABLE ALL WITH FRAME f-main
//WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.