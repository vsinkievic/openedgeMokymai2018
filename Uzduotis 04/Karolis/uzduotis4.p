output to "c:\mokymai\uzduotis_4.txt".
for each Customer no-lock 
  by Customer.Cust-Num:
      display Customer.Cust-Num label "Kliento ID" with stream-io.
      for each Invoice no-lock 
       where Invoice.Cust-Num = Customer.Cust-Num by 
       Invoice.Invoice-Date.
    display Invoice.Invoice-Date format "9999-99-99" label "Data"  Customer.Contact label "Vardas" Invoice.Order-Num label "U�sakymas" Invoice.Amount label "Suma" with stream-io.
    display Invoice.Amount( sum label "Bendra suma" max label "Didziausias u�sakymas" minimum label "Ma�iausias u�sakymas").
   end.
end.
output close.




