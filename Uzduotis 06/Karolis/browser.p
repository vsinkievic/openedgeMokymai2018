define variable isOk as log no-undo.

define query q-kliento for Klientas scrolling.
define browse b-kliento query q-kliento no-lock display Klientas.KlientoKodas label "Kliento kodas" 
      Klientas.KlientoVardas label "Vardas" Klientas.BendrasUzsakymuKiekis label "Uzsakymai"
      Klientas.BendraUzsakymuSuma label "Suma" with 5 down no-assign separators.

define query q-uzsakymo for Uzsakymas scrolling.
define browse b-uzsakymo query q-uzsakymo no-lock display Uzsakymas.KlientoKodas label "Kliento kodas"
      Uzsakymas.UzsakymoNr label "Uzsakymo Nr." Uzsakymas.Suma label "Suma" Uzsakymas.Data label "Data" format "9999-99-99"
      with 8 down no-assign separators.

define frame f-main
             b-kliento skip(2) 
             b-uzsakymo
             with 1 col title "Klientai" center.
             
define frame f-client
        Klientas.KlientoKodas label "Kliento Kodas" skip
        klientas.KlientoVardas label "Vardas" skip
        with 1 col title "Naujas Klientas" centered view-as dialog-box.    
        
define frame f-order
        Uzsakymas.UzsakymoNr label "Numeris" skip
        Uzsakymas.Data label "Data" format "9999-99-99" skip
        Uzsakymas.Suma label "Suma"
        with 1 col title "Uzsakymo info" centered view-as dialog-box.                    

on value-changed of b-kliento do:  
    run refresh-uzsakymai.
end.     

on value-changed of b-uzsakymo do:  
    get current q-kliento.
end.    

on "Ctrl-n" of b-kliento do:   
    run sukurk_klienta (output isOk).
    if isOK 
    then run refresh-klientas.
    else return no-apply.
end.      

on "Ctrl-D" of b-kliento do:  
    run istrink_klienta (output isOk).
    if isOK 
    then run refresh-klientas.
    else return no-apply.
end.  

on "return" of b-uzsakymo do:  
    run taisyk_uzsakyma (output isOk).
    if isOK
    then run refresh-klientas.
    else return no-apply.
end.

on "Ctrl-n" of b-uzsakymo do:   
    run sukurk_uzsakyma (output isOk).
    if isOK 
    then run refresh-klientas.
    else return no-apply.
end. 

on "Ctrl-d" of b-uzsakymo do:   
    run trink_uzsakyma (output isOk).
    if isOK 
    then run refresh-klientas.
    else return no-apply.
end. 
             
procedure refresh-klientas: 
    close query q-kliento .
    open query q-kliento FOR EACH klientas.
    browse b-kliento:refresh() no-error.
    run refresh-uzsakymai.
end.             
         
procedure refresh-uzsakymai:     
    close query q-uzsakymo.
    open query q-uzsakymo for each uzsakymas no-lock
    where Uzsakymas.KlientoKodas = Klientas.KlientoKodas.
    browse b-uzsakymo:refresh() no-error.
end.    

procedure sukurk_uzsakyma:
    
define output parameter isOk as log init false no-undo.
  do transaction:  
    create Uzsakymas.
    display Uzsakymas.UzsakymoNr Uzsakymas.Data Uzsakymas.Suma with frame f-order.
    update Uzsakymas.Suma with frame f-order.
    isOk = true.
    assign Uzsakymas.KlientoKodas = Klientas.KlientoKodas.
  end.
  hide frame f-order.   
end.    

procedure trink_uzsakyma:
define output parameter isOk as log init false no-undo.    
  define variable isConfirmed as log no-undo init false.
    message "Ar tikrai norite istrinti" view-as alert-box question 
    buttons yes-no-cancel update isConfirmed.
    if isConfirmed then do transaction:
        find current Uzsakymas exclusive-lock.
        delete Uzsakymas.
        isOK = true.
    end.
    hide frame f-client.
    
end.             

procedure taisyk_uzsakyma:
    
define output parameter isOk as log init false no-undo.

  do transaction:
      find current Uzsakymas exclusive-lock.
      display Uzsakymas.UzsakymoNr Uzsakymas.Data Uzsakymas.Suma with frame f-order.
      update Uzsakymas.Data Uzsakymas.Suma with frame f-order.
      assign Uzsakymas.KlientoKodas = Klientas.KlientoKodas.
      find current Uzsakymas no-lock.
      
      isOk = true.
  end.
  hide frame f-order.      
    
end.   
        
procedure sukurk_klienta:
    
define output parameter isOk as log init false no-undo.    

     do transaction:
     create Klientas.
     display Klientas.KlientoKodas Klientas.KlientoVardas label "Áveskite vardà" format "x(25)" with frame f-client. 
     update Klientas.KlientoVardas with frame f-client.   
     end.
     isOK = true.
     hide frame f-client.
     
end.    

procedure istrink_klienta:             
    
define output parameter isOk as log init false no-undo.
    
    define variable isConfirmed as log no-undo init false.
    message "Ar tikrai norite istrinti" view-as alert-box question 
    buttons yes-no-cancel update isConfirmed.
    if isConfirmed then do transaction:
        find current Klientas exclusive-lock.
        delete klientas.
        isOK = true.
    end.
    hide frame f-client.
             
end.             
             
run refresh-klientas.
enable all with frame f-main.
wait-for window-close of current-window.
           