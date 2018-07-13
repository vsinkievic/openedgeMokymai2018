define input parameter Cust-num as integer no-undo.

define temp-table ttOrder
    field Num as integer 
    field Cust-num as integer 
    field Order-date as datetime
    field Amount as decimal.

define query qOrd for ttOrder scrolling.

define browse bOrd query qOrd
    display ttOrder.Num ttOrder.Order-date ttOrder.Amount
    with 10 down no-assign expandable title "Orders of customer".

define frame fOrd 
    skip (1) space (8) bOrd skip(1) space (8)
    with no-box width 150.
    
run sget-orders.p (input Cust-num, output table ttOrder).
open query qOrd for each ttOrder.

enable all with frame fOrd.
wait-for window-close of current-window.

