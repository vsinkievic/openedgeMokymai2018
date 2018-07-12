{dataset.i}

define input-output parameter dataset for dsCustomer.
define variable iCustNum as integer  no-undo.
 
temp-table ttCustomer:tracking-changes = true.
update iCustNum label "Kliento kodas".
find ttCustomer where ttCustomer.Custnum = iCustNum.  
delete ttCustomer.
display "Klientas istrintas.".                                                         
temp-table ttCustomer:tracking-changes = false.