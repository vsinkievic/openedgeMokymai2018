define input parameter Cust-num as integer no-undo.
define variable iAmount as decimal no-undo.

define temp-table ttOrder
    field Num as integer 
    field Cust-num as integer 
    field Order-date as datetime
    field Amount as decimal.
    
define output parameter table for ttOrder.

for each Order where Order.CustNum = Cust-num no-lock:
    ttOrder.Num = Order.Ordernum.
    ttOrder.Cust-num = Order.Custnum.
    ttOrder.Order-date = Order.OrderDate.
    
    for each OrderLine of Order:
        iAmount = iAmount + OrderLine.Price * OrderLine.Qty.
    end.
    ttOrder.Amount = iAmount.
end.

    