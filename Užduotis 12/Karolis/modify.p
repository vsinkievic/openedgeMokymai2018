{datasetai/data.i}

define input-output parameter dataset for dsTable.

define variable klientoKodass as integer  no-undo.
 
temp-table ttCustomer:tracking-changes = true.

                                           
      update klientoKodass.                                          
      find ttCustomer where ttCustomer.Cust-Num = klientoKodass.          
      if available ttCustomer
      then display ttCustomer.Address ttCustomer.Name ttCustomer.Phone.
      update ttCustomer.Address ttCustomer.Name ttCustomer.Phone.                  
                                                      


temp-table ttCustomer:tracking-changes = false.