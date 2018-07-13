define temp-table ttOrder
    field num as integer
    field OrderDate as date
    field OrderSum as decimal.

define input parameter cName as character.
define input-output parameter table for ttOrder.
define variable num as integer no-undo.
define variable OrderSum as decimal no-undo.

cName = "*" + cName + "*".
find first Customer where Customer.Name matches(cName) no-lock no-error.
num = Customer.CustNum.
for each Order where Order.CustNum = num no-lock:
    create ttOrder.
    ttOrder.num = Order.ordernum.
    ttOrder.OrderDate = Order.OrderDate.
    for each Orderline where Order.ordernum = OrderLine.ordernum:
        ordersum = ordersum + OrderLine.Price * OrderLine.Qty.
    end.
    ttOrder.OrderSum = ordersum.
end.