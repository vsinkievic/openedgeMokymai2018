define variable new-name as character no-undo format "x(20)".
define variable max as decimal no-undo.
define variable min as decimal no-undo.
define variable sum as decimal no-undo.

output to "output.txt" convert target "utf-8".

for each Customer no-lock:
    
    new-name = replace(Customer.Contact, substring(Customer.Contact, 2, index(Customer.Contact, " ") - 1), ". ").
    display Customer.CustNum label "Kliento nr." new-name format "!(35)" label "V. Pavardė" with stream-io.
    
    for each Invoice no-lock 
    where Invoice.CustNum = Customer.CustNum
    by Invoice.InvoiceDate:
        display
            Invoice.InvoiceDate format "9999-99-99" label "Data"
            Invoice.InvoiceNum label "Nr."
            Invoice.Amount label "Suma".
        display Invoice.Amount (max label "Didžiausia" min label "Mažiausia" sum label "Iš viso").
    end.        
end.

for each Invoice no-lock:
    display Invoice.Amount(sum label "Suma" minimum label "Mažiausias" max label "Didžiausias").
end.
output close.