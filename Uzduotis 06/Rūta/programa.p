define variable custBrowse      as handle    no-undo.
define variable ordBrowse       as handle    no-undo.
define variable custQuery       as handle    no-undo.
define variable ordQuery        as handle    no-undo.
define variable customerBuffer  as handle    no-undo.
define variable orderBuffer     as handle    no-undo.
define variable addCustomer     as handle    no-undo.
define variable updateOrder     as handle    no-undo.
define variable custName        as character no-undo.
define variable custNum         as integer   no-undo.
define variable iOrderNum       as integer   no-undo.

run userInterface.

/*naudotojo sasaja*/

procedure userInterface:

form with frame ui width 80 title "BROWSE" 0 down.

create buffer customerBuffer for table "Klientas".
create buffer orderBuffer for table "Uzsakymas".
create query custQuery.
create query ordQuery.
 
custQuery:set-buffers(customerBuffer).
custQuery:query-prepare("for each Klientas no-lock").
custQuery:query-open.

create browse custBrowse
    assign width     = 60
           down      = 10
           query     = custQuery
           frame     = frame ui:handle
           read-only = false
           sensitive = true.
           
custBrowse:add-like-column("Klientas.Kodas").
custBrowse:add-like-column("Klientas.Vardas").
custBrowse:add-like-column("Klientas.UzSuma").
custBrowse:add-like-column("Klientas.UzKiekis").

ordQuery:set-buffers(orderBuffer).

create browse ordBrowse
    assign y         = 200
           width     = 60
           down      = 10
           query     = ordQuery
           frame     = frame ui:handle
           read-only = false
           sensitive = true.
           
ordBrowse:add-like-column("Uzsakymas.Numeris").                                                                                        
ordBrowse:add-like-column("Uzsakymas.Pavadinimas").                                                                                    
ordBrowse:add-like-column("Uzsakymas.Data").

create button addCustomer
    assign x         = 10
           y         = 400
           width     = 20
           frame     = frame ui:handle
           sensitive = true
           visible   = true
           label     = "Naujas klientas"  
    triggers:
        on choose
            do:
                run addCustomer.
                custQuery:query-prepare("for each Klientas no-lock").
                custQuery:query-open.
            end.
    end triggers.
    
create button updateOrder
    assign x         = 150
           y         = 400
           width     = 20
           frame     = frame ui:handle
           sensitive = true
           visible   = false
           label     = "Taisyti uzsakyma"  
    triggers:
        on choose
            do:
                run updateOrder. 
            end.
    end triggers.
           
on enter of custBrowse do:
    updateOrder:visible = true.
    run custOrders.
    readkey.
    if lastkey = keycode("Del") then run deleteOrder.
    if lastkey = keycode("Insert") then run createOrder.   
end.
      
view frame ui.
 
wait-for close of this-procedure.
 
delete object custBrowse.
delete object custQuery.
delete object customerBuffer.
delete object orderBuffer.

end procedure.

/*kliento uzsakymu perziura*/

procedure custOrders: 
ordQuery:query-prepare(substitute("for each Uzsakymas where Uzsakymas.Kodas = &1", customerBuffer:buffer-field("Kodas"):buffer-value)).
ordQuery:query-open.
end procedure.

/*prideti nauja klienta*/

procedure addCustomer:
    update custNum label "Kliento kodas" help "Iveskite kliento koda!" 
    custName label "Kliento vardas" help "Iveskite kliento varda!".

    find Klientas where Klientas.Kodas = custNum no-error.
    if available Klientas then message "Toks klientas jau egzistuoja." view-as alert-box error.
    else do:
        create Klientas.
        Klientas.Kodas = custNum.
        Klientas.Vardas = custName.
    end.
end procedure.

/*taisyti uzsakyma*/

procedure updateOrder:
    find first Uzsakymas where Uzsakymas.Numeris = orderBuffer:buffer-field("Numeris"):buffer-value.
    if not available Uzsakymas then message "Toks uzsakymas neegzistuoja." view-as alert-box error. 
    else do transaction:
        display Uzsakymas.Data Uzsakymas.Pavadinimas Uzsakymas.Suma. 
        update Uzsakymas.Data help "Iveskite uzsakymo data."
               Uzsakymas.Pavadinimas help "Iveskite uzsakymo pavadinima."
               Uzsakymas.Suma help "Iveskite uzsakymo suma.".
    end.
    ordQuery:query-open.
end procedure.

/*istrinti uzsakyma*/

procedure deleteOrder:
    find first Uzsakymas where Uzsakymas.Numeris = orderBuffer:buffer-field("Numeris"):buffer-value.
    if not available Uzsakymas then message "Toks uzsakymas neegzistuoja." view-as alert-box error.
    else do transaction:
        display Uzsakymas.Data Uzsakymas.Pavadinimas Uzsakymas.Suma. 
        delete Uzsakymas.
    end.
    ordQuery:query-open.
end procedure.

/*ivesti nauja uzsakyma*/

procedure createOrder:
    find first Klientas where Klientas.Kodas = customerBuffer:buffer-field("Kodas"):buffer-value.
    if not available Klientas then message "Toks klientas neegzistuoja." view-as alert-box error.
    else do transaction:
        create Uzsakymas.
        update Uzsakymas.Pavadinimas help "Iveskite uzsakymo pavadinima!" 
               Uzsakymas.Data help "Iveskite uzsakymo data!"
               Uzsakymas.Suma  help "Iveskite uzsakymo suma!".
        Uzsakymas.Kodas = Klientas.Kodas.
        display Uzsakymas.Numeris Uzsakymas.Data Uzsakymas.Pavadinimas Uzsakymas.Suma.
    end.
    ordQuery:query-open.
end procedure.