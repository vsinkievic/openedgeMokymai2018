trigger procedure for create of Orders.

assign Orders.OrderDate = now.
assign Orders.OrderNr = next-value(orderNumSq).