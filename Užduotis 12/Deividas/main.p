{DataSet.i}
{Buttons.i}

on choose of AddCustomer do:
    run create.p(input-output dataset dsUzduotis). 
end.

on choose of ShowCustomers do:
    for each ttCustomer:
        display ttCustomer.CustNum ttCustomer.name ttCustomer.comments format "x(20)".
    end.  
end.

on choose of DeleteCustomer do:
       run delete.p(input-output dataset dsUzduotis).
end.

on choose of UpdateCustomer do:
       run update.p(input-output dataset dsUzduotis).
end.

on choose of Ataskaita do:
    
    define variable c as integer no-undo.
    define variable d as integer no-undo.
    define variable u as integer no-undo.
    
/*    for each befCustomer:                      */
/*        buffer befCustomer:save-row-changes ().*/
/*    end.                                       */
    for each ttCustomer: 
    case row-state(ttCustomer): 
        when row-created then c = c + 1.
        when row-modified then u = u + 1.
   end.
end.
for each befCustomer where row-state(befCustomer) = row-deleted: 
         d = d + 1.
end.
message subst("Created=&1 updated=&2 deleted=&3", c, u, d).
end.


define data-source srcCustomer for Customer.

buffer ttCustomer:attach-data-source (data-source srcCustomer:HANDLE).

data-source srcCustomer:fill-where-string = "where Customer.Country = 'France'" .

dataset dsUzduotis:fill().

buffer ttcustomer:detach-data-source ().

define variable i as integer no-undo.


for each ttCustomer:
    i = i + 1.
end.
message "Ið viso yra " i "áraðø".




  enable all with frame Meniu.
  wait-for window-close of current-window.



