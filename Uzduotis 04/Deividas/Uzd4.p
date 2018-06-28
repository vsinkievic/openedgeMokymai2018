define variable vardas as character no-undo format "x(30)".
define variable maxi as decimal no-undo.
define variable minimal as decimal no-undo.
define variable suma as decimal no-undo.
output to KlientuSaskaitos.txt.


for each Customer no-lock:
    vardas = replace(Customer.Contact, substring(Customer.Contact,2,index(Customer.Contact," ") - 1), ". ").
    display Customer.CustNum label "Kliento kodas" vardas format "!(30)" label "Klientas" with stream-io.
    for each Invoice no-lock
        where Invoice.CustNum = Customer.CustNum
        by Invoice.InvoiceDate.
        display Invoice.InvoiceDate format 9999-99-99 label "Data" Invoice.Invoicenum label "Saskaitos numeris" Invoice.Amount label "Suma" with stream-io.
        display Invoice.Amount (minimum label "Minimali" max label "Maksimali" sum label "Bendra").
    end.
    
end.
        select max(Invoice.Amount) into maxi from Invoice.
        select min(Invoice.Amount) into minimal from Invoice.
        select sum(Invoice.Amount) into suma from Invoice.
        
        display suma  label "Visu suma"  minimal label "Minimali reiksme"  maxi label "Maksimali reiksme"  with stream-io.
output close.