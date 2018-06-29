TRIGGER PROCEDURE FOR DELETE OF Order.

find customer where customer.id = order.customerid.
customer.orderscount = customer.orderscount - 1.
customer.orderstotal = customer.orderstotal - order.amount.
