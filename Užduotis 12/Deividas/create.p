{DataSet.i}

    
define input-output parameter dataset for dsUzduotis. 
define variable CNumber as integer no-undo.

temp-table ttCustomer:tracking-changes = true. 
    find last ttCustomer.
    CNumber = ttCustomer.CustNum + 1.
    create ttCustomer. 
    ttCustomer.CustNum = Cnumber.
    ttCustomer.Country = 'France'.
    ttCustomer.City = 'Paris'.
    update ttCustomer.Name.
temp-table ttCustomer:tracking-changes = false.
