define variable vardas as character no-undo.

output to ataskaita.txt.

for each Customer no-lock:
    vardas = replace(Customer.Contact, substring(Customer.Contact, 2, index(Customer.Contact, " ") - 1), ". "). 
    display Customer.CustNum label "Kliento kodas" vardas format "!(30)" label "Kliento vardas" with stream-io.
    for each Invoice no-lock where Invoice.CustNum = Customer.CustNum by Invoice.InvoiceDate:
        display Invoice.InvoiceDate label "Data" format "9999-99-99" Invoice.InvoiceNum label "Numeris" Invoice.Amount label "Suma" with stream-io.
        display Invoice.Amount (max label "Didziausia" minimum label "Maziausia" sum label "Visa") with stream-io.
    end.
end.

for each Invoice no-lock:
    display Invoice.Amount(max label "Didziausia" minimum label "Maziausia" sum label "Visa") with stream-io.
end.

output close.
