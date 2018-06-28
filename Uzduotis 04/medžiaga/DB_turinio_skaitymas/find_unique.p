find last customer no-lock where Customer.Balance > 10 use-index name.
find first customer no-lock where Customer.name > "".


display custnum Customer.Name with 1 col with width 200.


for first customer no-lock where Customer.Balance > 10
        by Customer.balance desc : 
    
    display custnum balance .
end.

for each customer no-lock where Customer.Balance > 10
        by balance desc: 
    
    display custnum balance.
    leave.
end.

