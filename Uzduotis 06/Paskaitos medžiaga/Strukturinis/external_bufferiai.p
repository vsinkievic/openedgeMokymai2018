define variable i as integer no-undo.
define variable parametras as integer no-undo.
define variable kitas-param as integer no-undo.

function funkcija returns int (): 
    return Customer.CustNum * 10.
end.

for each Customer no-lock i = 1 to 5:
    run external_proc(Customer.custnum, output kitas-param).
    run vidine (output parametras).
    display Customer.Name Customer.CustNum parametras funkcija().
end.


procedure vidine: 
    define output parameter iResult as int no-undo.
    
    iResult = Customer.CustNum * 1000.
end.