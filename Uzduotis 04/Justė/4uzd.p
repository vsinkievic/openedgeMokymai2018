define variable maxValue as decimal no-undo.
define variable minValue as decimal no-undo.
define variable totValue as decimal no-undo.

define variable tempName as character no-undo.
define variable hasRecords as logical no-undo.

output to "ats.txt".

for each Customer no-lock:
    hasRecords = false.
    if (length(contact) <> 0) then tempName = replace(contact,".","").
    else tempName = " -".
    display substitute("&1 &2. &3",custnum, substring(contact,1,1), entry(2,tempName," "))
    format "!(50)" label "Klientas" with stream-io.
    for each Invoice where custnum = Customer.custnum break by invoicedate by amount descending: 
        hasRecords = true.
        display Invoice.InvoiceDate format "9999-99-99" label "Data"
                invoicenum label "Numeris"
                amount label "Suma" with stream-io. 
        display Invoice.Amount (min label "Maziausia suma" max label "Didziausia suma" sum label "Viso") with stream-io.  
    end.
    if (hasRecords = false ) then display skip "-NO ORDERS-".
end.                            

display accum min amount label "Maziausia suma" max label "Didziausia suma" total label "Viso" with stream-io.

output close.




