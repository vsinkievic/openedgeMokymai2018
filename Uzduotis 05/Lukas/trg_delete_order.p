trigger procedure for delete of Orders.

find Customer where Orders.CustId = Customer.CustId.
Customer.OrderTotal = Customer.OrderTotal - Orders.OrderAmount.
Customer.TotalOrders = Customer.TotalOrders - 1.