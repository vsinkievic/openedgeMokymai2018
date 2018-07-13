define variable cName as character no-undo format "x(20)".

define temp-table ttCust 
    field CustName as character format "x(30)"
    field Balance as decimal
    field OrderDate as date.

define query qCust for ttCust.
define browse bCust query qCust display CustName Balance OrderDate with 100 down.
define frame fCust cName skip bCust with width 60.

enable bCust with frame fCust.

update cName label "Kliento vardas" with frame fCust.

run sget-cust(input cName , input-output table ttCust).
open query qCust for each ttCust.

on "enter" of bCust do:
    find current ttCust.
    run ui-orders.p(input ttCust.CustName, ttCust.Balance).
end.


wait-for window-close of current-window.
