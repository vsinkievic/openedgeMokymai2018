
define variable diena as date no-undo init ?.

define variable saskaitu as integer no-undo.
define variable kliento-saskaitu as integer no-undo.

output to ataskaita.txt.
for each Order no-lock 
    break by orderdate by Order.CustNum descending: 

    if first-of (Orderdate) 
    then saskaitu = 0.
    
    if first-of(custnum)
    then kliento-saskaitu  = 0.
    
    accumulate ordernum (count by custnum).
       
    saskaitu = saskaitu + 1.
    kliento-saskaitu = kliento-saskaitu + 1.
   
   if last-of(custnum)
   then do:
       find Customer no-lock of Order.
       display orderdate Customer.Name /*(accum ordernum count by custnum) label "Accum"*/
         kliento-saskaitu (total by orderdate).
   end.
            
/*    if last-of(orderdate)           */
/*    then display orderdate saskaitu.*/
end.

output close.