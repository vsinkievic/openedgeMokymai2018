{datasetai/data.i}

define input-output parameter dataset for dsTable.
define variable isConfirmed as log no-undo init false.
define variable klientoKodass as integer  no-undo.
 
temp-table ttCustomer:tracking-changes = true.

                                           
      update klientoKodass.                                          
      find ttCustomer where ttCustomer.Cust-Num = klientoKodass.          
      if available ttCustomer then                   
      message "Ar tikrai norite istrinti" view-as alert-box question
      buttons yes-no-cancel update isConfirmed.                                   
      if isConfirmed then do:                                      
        delete ttCustomer.
                                                  
      end.                                                          


temp-table ttCustomer:tracking-changes = false.