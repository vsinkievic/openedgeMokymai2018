define temp-table ttCustomer
    field Num as integer
    field Cust-name as character
    field Balance as decimal.


define input parameter cName as character.
define output parameter table for ttCustomer.

for each Customer where Customer.Name matches(string(cName) + "*") no-lock:
    create ttCustomer.
    ttCustomer.Cust-name = Customer.Name.
    ttCustomer.Num = Customer.CustNum.
    ttCustomer.Balance = Customer.Balance.

end.

    
    