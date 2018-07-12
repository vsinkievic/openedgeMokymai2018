{datasetai/data.i}

define button sukurkKlienta label "Kliento sukurimas".
define button istrinkKlienta label "Kliento iğtrinimas".
define button atnaujinkKlienta label "Kliento Atnaujinimas".

define frame fMygtukai sukurkKlienta istrinkKlienta atnaujinkKlienta with side-labels row 1.

define data-source srcCustomer for Customer.
buffer ttCustomer:attach-data-source (data-source srcCustomer:handle).
dataset dsTable:fill().

on choose of sukurkKlienta do:
    run datasetai/create.p(input-output dataset dsTable).
    for each befCustomer:                      
         buffer befCustomer:save-row-changes ().
    end. 
end.    

on choose of istrinkKlienta do:
    run datasetai/delete.p(input-output dataset dsTable).
     for each befCustomer:                      
         buffer befCustomer:save-row-changes ().
    end. 
end.    

on choose of atnaujinkKlienta do:
    run datasetai/modify.p(input-output dataset dsTable).
     for each befCustomer:                      
         buffer befCustomer:save-row-changes ().
    end. 
end.    


buffer befCustomer:detach-data-source().

enable sukurkKlienta istrinkKlienta atnaujinkKlienta with frame fMygtukai.
wait-for window-close of current-window.