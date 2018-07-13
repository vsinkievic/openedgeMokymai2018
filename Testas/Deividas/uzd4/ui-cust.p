define variable Fragmentas as character no-undo format "x(20)".

 update Fragmentas with frame Langas.
 
define query q1 for Customer scrolling. 

define browse BCustomer query q1 no-lock display Customer.Name Customer.Balance
    with 10 down no-assign separators.
    
    
    
define frame Langas
    Fragmentas label "Kliento pavadinimo fragmentas" skip(1)
    BCustomer
    with no-box width 150.
    
    open query q1 for each Customer no-lock where Customer.Name matches(Fragmentas + "*").
    browse BCustomer:refresh() no-error.
   
    



    
  enable all with frame Langas.
  wait-for window-close of current-window.

   
    

