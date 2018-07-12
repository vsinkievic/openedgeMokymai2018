{dataset.i}

define button createButton label "Sukurti klienta".
define button deleteButton label "Istrinti klienta".
define button updateButton label "Atnaujinti kliento duomenis".
define frame fCustomer createButton updateButton deleteButton.
define data-source srcCustomer for Customer.

buffer ttCustomer:attach-data-source(data-source srcCustomer:handle).
dataset dsCustomer:fill().

on choose of createButton do:
    run create(input-output dataset dsCustomer).
    for each ttbCustomer:                      
         buffer ttbCustomer:save-row-changes.
    end. 
end.    

on choose of deleteButton do:
    run delete(input-output dataset dsCustomer).
    for each ttbCustomer:                      
        buffer ttbCustomer:save-row-changes.
    end. 
end.    

on choose of updateButton do:
    run update(input-output dataset dsCustomer).
    for each ttbCustomer:                      
        buffer ttbCustomer:save-row-changes.
    end. 
end.    

enable createButton updateButton deleteButton with frame fCustomer.
wait-for window-close of current-window.