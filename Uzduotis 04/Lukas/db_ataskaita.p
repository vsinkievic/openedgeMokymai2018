define variable name-surname as character no-undo format "!(50)".
define variable part-to-replace as character no-undo format "!(50)".
define variable totalMax as decimal no-undo init 0.
define variable totalMin as decimal no-undo init ?.
define variable totalSum as decimal no-undo init 0.

output to ataskaita.txt.

for each Customer no-lock
    by Customer.Cust-Num:
        
        name-surname = Customer.Contact.
        part-to-replace = substr(name-surname, 2, index(name-surname, " ") - 1).
        name-surname = replace(name-surname, part-to-replace, ". ").
        display Customer.Cust-Num label "Kliento nr." name-surname label "V. Pavard�" with stream-io.
        
        for each Invoice no-lock
            where Invoice.Cust-Num = Customer.Cust-Num
            by Invoice.Invoice-Date:

                display Invoice.Invoice-Num label "S�skaitos nr." Invoice.Invoice-Date format "9999-99-99" label "Data" Invoice.Amount label "Suma" with stream-io.
                display Invoice.Amount (sum label "Bendra suma" max label "Did�. suma" minimum label "Ma�. suma") with stream-io.
                
                totalSum = totalSum + Invoice.Amount.
                if totalMin = ? then totalMin = Invoice.Amount.
                if totalMin > Invoice.Amount then totalMin = Invoice.Amount.
                if totalMax < Invoice.Amount then totalMax = Invoice.Amount.      
                
        end.
        
end.

display totalSum label "Bendra vis� s�sk. suma" totalMax label "Did�. vis� s�sk. suma" totalMin label "Ma�. vis� s�sk. suma" with stream-io.

output close.