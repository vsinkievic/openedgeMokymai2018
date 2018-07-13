define variable klientoVardas as character format "x(20)" no-undo.

update klientoVardas label "Áveskite pav." with frame f-main.

define query q-kliento for Customer scrolling.
define browse b-kliento query q-kliento no-lock display Customer.Name 
                                       Customer.Balance with 5 down no-assign separators.
define frame f-main
             klientoVardas format "x(20)"
             b-kliento 
             with 1 col title "Klientai" center.
                                                                  
open query q-kliento 
      for each Customer no-lock where Customer.Name matches(klientoVardas + "*") by Customer.Balance desc.  
browse b-kliento:refresh() no-error.   

procedure refresh-klientas: 
    close query q-kliento .
    open query q-kliento 
      for each Customer no-lock where Customer.Name matches(klientoVardas + "*") by Customer.Balance desc.  
    browse b-kliento:refresh() no-error.
end.      

enable all with frame f-main.
wait-for window-close of current-window.
                                                          