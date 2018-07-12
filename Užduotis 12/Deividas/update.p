{DataSet.i}

define input-output parameter dataset for dsUzduotis. 

    define variable NumToUpdate as integer no-undo.
    update NumToUpdate label "Numeris kliento,kuri norite modifikuoti".
    
    temp-table ttCustomer:tracking-changes = true.

    find ttCustomer where ttCustomer.CustNum = NumToUpdate.

    display "Kliento vardas yra: " ttCustomer.Name.
    update ttCustomer.Name.

    temp-table ttCustomer:tracking-changes = false.
