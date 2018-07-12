{DataSet.i}
    
    define input-output parameter dataset for dsUzduotis. 

    define variable NumToDelete as integer no-undo.
    update NumToDelete label "Numeris Kliento, kurá norite trinti".
    
    temp-table ttCustomer:tracking-changes = true.
    
    find ttCustomer where ttCustomer.CustNum = NumToDelete.
    
    message "Ar tikrai norite Naikinti Klienta kurio vardas " ttCustomer.Name " ir numeris " ttCustomer.CustNum 
    view-as alert-box 
    question buttons yes-no update
        lOKtoDelete as logical.
        if lOKtoDelete then 
            do:
                delete ttCustomer.
                message "Klientas iðtrintas!" view-as alert-box.
            end.

    temp-table ttCustomer:tracking-changes = false.
