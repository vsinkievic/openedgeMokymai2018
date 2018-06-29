define variable iCustNum as integer no-undo.

define variable i as integer no-undo.

define frame fUpdate 
     Customer.CustNum Customer.Name skip
     Customer.City skip
     Customer.address
     with side-labels 1 col.
        
        
for each Customer no-lock 
    by custnum descending
     i = 1 to 5
        :
    display Customer.CustNum Customer.Name Customer.city.
end.

update iCustNum 
    label "Kliento numeris" 
    help "Áveskite ieðkomo kliento numerá"
    with side-labels. 
message iCustNum.

find Customer exclusive-lock where Customer.CustNum = iCustNum. 
display custnum name address city with frame fUpdate. 
enable Customer.Address 
       Customer.City help "Áveskite miestà" 
with frame fUpdate.

WAIT-FOR go OF CURRENT-WINDOW.
assign frame fUpdate Customer.city.

message Customer.City Customer.address.
