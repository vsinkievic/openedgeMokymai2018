{dataset.i}

define data-source srcCust for Customer.

buffer ttCust:ATTACH-DATA-SOURCE(DATA-SOURCE srcCust:HANDLE).

dataset dsCust:FILL().

//dataset dsCust:write-xml ("file", "customers.xml", true).

define button createCust label "Create customer".
define button updateCust label "Update customer".
define button deleteCust label "Delete customer".

define frame f createCust updateCust deleteCust.

on choose of createCust do: 
    run create.p(input-output dataset dsCust).
    for each befCust:
        buffer befCust:SAVE-ROW-CHANGES().
    end.
end.

on choose of updateCust do: 
    run update.p(input-output dataset dsCust).
    for each befCust:
        buffer befCust:SAVE-ROW-CHANGES().
    end.
end.

on choose of deleteCust do: 
    run delete.p(input-output dataset dsCust).
    for each befCust:
        buffer befCust:SAVE-ROW-CHANGES().
    end.
end.

enable all with frame f.
wait-for window-close of current-window.