define temp-table ttCust 
    field CustName as character
    field Balance as decimal
    field OrderDate as date.

define input parameter cName as character.
define input-output parameter table for ttCust.

cName = "*" + cName + "*".
for each Customer where Customer.Name matches(cName) no-lock:
    create ttCust.
    ttCust.CustName = Customer.Name.
    ttCust.Balance = Customer.Balance.
    for each Order where Order.CustNum = Customer.CustNum by Order.OrderDate descending:
        ttCust.OrderDate = Order.OrderDate.
        leave.
    end.
end.