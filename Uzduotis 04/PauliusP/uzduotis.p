define variable pirmaRaide as character no-undo format "x(40)".
output to "ataskaita.txt" convert target "utf-8".
for each Customer no-lock:

pirmaRaide = replace(Customer.Contact,substr(Customer.Contact,2,index(Customer.Contact, " ") - 1),". ").



display CustNum label "Kliento ID" pirmaRaide format "!(30)" label "Klientas" with stream-io.
    for each Invoice no-lock
    where Invoice.CustNum = Customer.CustNum
    by Invoice.InvoiceDate.
    
    display Invoice.InvoiceDate format "9999-99-99" label "Data" Invoice.Invoicenum label "S�skaitos nr." Invoice.Amount label "Suma" with stream-io.
    display Invoice.Amount(max label "Did�iausias" minimum label "Ma�iausias" sum label "Suma").
    end.
end.

for each Invoice no-lock:
display Invoice.Amount(max label "Did�iausias" minimum label "Ma�iausias" sum label "Suma").
end.

output close.