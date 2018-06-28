define variable cVardas as character no-undo.

define stream saskaitos.
output stream saskaitos to saskaitos_alt.txt.

display stream saskaitos "Sàskaitø registras pagal klientus" format "x(50)" with frame hdr page-top centered no-box.

for each Invoice no-lock
    break by Invoice.Cust-Num
            by Invoice.Invoice-Date:

    if first-of(Cust-Num)
    then do:
        find Customer no-lock of Invoice.
        cVardas = replace(Customer.Contact, substring(Customer.Contact, 2, index(Customer.Contact, " ") - 1), ". ").
    
       display stream saskaitos 
           Customer.Cust-Num no-label
           cVardas format "!(30)" no-labels.
    end.
    
    accumulate Invoice.Amount (total by Invoice.Cust-Num).
    accumulate Invoice.Amount (maximum by Invoice.Cust-Num).
    accumulate Invoice.Amount (minimum by Invoice.Cust-Num).
    
    display stream saskaitos 
        Invoice.Invoice-Date format "9999-99-99" label "Data"
        Invoice.Invoice-Num label "Nr."
        Invoice.Amount label "Suma" with centered with width 400.
        
    if last-of(Invoice.Cust-Num)
    then do:
        display stream saskaitos 
            accum total by Invoice.Cust-Num (Invoice.Amount) format ">>>>>>9.99" label "Ið viso"
            accum maximum by Invoice.Cust-Num (Invoice.Amount) format ">>>>>>9.99" label "Didþiausia"
            accum minimum by Invoice.Cust-Num (Invoice.Amount) format ">>>>>>9.99" label "Maþiausia" 
            with width 400
            with frame footr.
    end.
    
end.


define variable maxInv as decimal no-undo.
define variable minInv as decimal no-undo.
define variable sumInv as decimal no-undo.

select max(Invoice.Amount) into maxInv from Invoice.
select min(Invoice.Amount) into minInv from Invoice.
select sum(Invoice.Amount) into sumInv from Invoice.


display stream saskaitos
    "Didþiausia sàskaita:"  format "x(40)"
    maxInv                  format ">>>>>>>>>9.99"
    no-labels skip with stream-io.
display stream saskaitos
    "Maþiausia sàskaita:"   format "x(40)"
    minInv format ">>>>>>>>>9.99"
    no-labels skip with stream-io.
display stream saskaitos
    "Ið viso iðraðyta sàskaitø:"   format "x(40)"
    sumInv format ">>>>>>>>>9.99"
    no-labels skip with stream-io.


output close.