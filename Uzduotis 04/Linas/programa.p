define variable cVardas as character no-undo.

define stream saskaitos.
output stream saskaitos to saskaitos.txt.

for each Customer no-lock:
    
    cVardas = replace(Customer.Contact, substring(Customer.Contact, 2, index(Customer.Contact, " ") - 1), ". ").
    
    display stream saskaitos 
        Customer.Cust-Num label "Kliento Nr."
        cVardas format "!(30)" label "V. Pavard�" with stream-io.
    
    for each Invoice no-lock    
        where Invoice.Cust-Num = Customer.Cust-Num
        by Invoice.Invoice-Date:
            
            display stream saskaitos 
                Invoice.Invoice-Date format "9999-99-99" label "Data"
                Invoice.Invoice-Num label "Nr."
                Invoice.Amount label "Suma".
            display stream saskaitos Invoice.Amount (max label "Did�iausia" min label "Ma�iausia" sum label "I� viso").
    end.
end.

define variable maxInv as decimal no-undo.
define variable minInv as decimal no-undo.
define variable sumInv as decimal no-undo.

select max(Invoice.Amount) into maxInv from Invoice.
select min(Invoice.Amount) into minInv from Invoice.
select sum(Invoice.Amount) into sumInv from Invoice.


display stream saskaitos 
    "Did�iausia s�skaita:"  format "x(40)"
    maxInv                  format ">>>>>>>>>9.99"
    no-labels skip with stream-io.
display stream saskaitos 
    "Ma�iausia s�skaita:"   format "x(40)"
    minInv format ">>>>>>>>>9.99"
    no-labels skip with stream-io.
display stream saskaitos 
    "I� viso i�ra�yta s�skait�:"   format "x(40)"
    sumInv format ">>>>>>>>>9.99"
    no-labels skip with stream-io.


output close.