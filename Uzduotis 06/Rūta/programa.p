
define variable custBrowse      as handle    no-undo.
define variable custQuery       as handle    no-undo.
define variable customerBuffer  as handle    no-undo.
define variable orderBuffer     as handle    no-undo.
define variable addCustomer     as handle    no-undo.
define variable updateOrder     as handle    no-undo.
define variable custName        as character no-undo.
define variable custNum         as integer   no-undo.
define variable iOrderNum       as integer   no-undo.

run userInterface.

// naudotojo sasaja

procedure userInterface:

form with frame x width 100 title "BROWSE" 40 down.

create buffer customerBuffer for table "Klientas".
create query custQuery.
 
custQuery:set-buffers(customerBuffer).
custQuery:query-prepare("for each Klientas no-lock").
custQuery:query-open.

create browse custBrowse
    assign width     = 80
           down      = 10
           query     = custQuery
           frame     = frame x:handle
           read-only = false
           sensitive = true.
           
custBrowse:add-like-column("Klientas.Kodas").
custBrowse:add-like-column("Klientas.Vardas").
custBrowse:add-like-column("Klientas.UzSuma").
custBrowse:add-like-column("Klientas.UzKiekis").

create button addCustomer
    assign x         = 30
           y         = 250
           width     = 20
           frame     = frame x:handle
           sensitive = true
           visible   = true
           label     = "Naujas klientas"  
    triggers:
        on choose
            do:
                run addCustomer.
            end.
    end triggers.
    
create button updateOrder
    assign x         = 30
           y         = 250
           width     = 20
           frame     = frame x:handle
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
    addCustomer:visible = false.
    updateOrder:visible = true.
    run custOrders.
    readkey.
    if lastkey = keycode("Del") then run deleteOrder.
    if lastkey = keycode("Insert") then run createOrder.
end.
      
view frame x.
 
wait-for close of this-procedure.
 
delete object custBrowse.
delete object custQuery.
delete object customerBuffer.
delete object orderBuffer.

end procedure.

// kliento uzsakymu perziura

procedure custOrders:
    create buffer orderBuffer for table "Uzsakymas".

    custQuery:query-close().
    custQuery:set-buffers(orderBuffer).
    custQuery:query-prepare(substitute("for each Uzsakymas where Uzsakymas.Kodas = &1", customerBuffer:buffer-field("Kodas"):buffer-value)).
    custQuery:query-open.

    custBrowse:query = custQuery.
    custBrowse:add-like-column("Uzsakymas.Numeris").
    custBrowse:add-like-column("Uzsakymas.Pavadinimas").
    custBrowse:add-like-column("Uzsakymas.Data").
end procedure.

// prideti nauja klienta

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

// taisyti uzsakyma

procedure updateOrder:
    update iOrderNum 
        label "Uzsakymo numeris" 
        help "Iveskite ieskomo uzsakymo numeri."
        with side-labels 1 col. 
    message iOrderNum.

    find first Uzsakymas where Uzsakymas.Numeris = iOrderNum no-error.
    if not available Uzsakymas then message "Toks uzsakymas neegzistuoja." view-as alert-box error. 
    else do transaction:
        display Uzsakymas.Data Uzsakymas.Pavadinimas Uzsakymas.Suma. 
        update Uzsakymas.Data help "Iveskite uzsakymo data."
               Uzsakymas.Pavadinimas help "Iveskite uzsakymo pavadinima."
               Uzsakymas.Suma help "Iveskite uzsakymo suma.".
    end.
end procedure.

// istrinti uzsakyma

procedure deleteOrder:
    update iOrderNum 
        label "Uzsakymo numeris" 
        help "Iveskite ieskomo uzsakymo numeri."
        with side-labels 1 col. 
    message iOrderNum.

    find first Uzsakymas where Uzsakymas.Numeris = iOrderNum no-error.
    if not available Uzsakymas then message "Toks uzsakymas neegzistuoja." view-as alert-box error.
    else do transaction:
        display Uzsakymas.Data Uzsakymas.Pavadinimas Uzsakymas.Suma. 
        delete Uzsakymas.
    end.
end procedure.

// ivesti nauja uzsakyma

procedure createOrder:
    update custNum label "Kliento kodas" help "Iveskite kliento koda!".
    find first Klientas where Klientas.Kodas = custNum no-error.
    if not available Klientas then message "Toks klientas neegzistuoja." view-as alert-box error.
    else do transaction:
        create Uzsakymas.
        update Uzsakymas.Pavadinimas help "Iveskite uzsakymo pavadinima!" 
               Uzsakymas.Data help "Iveskite uzsakymo data!"
               Uzsakymas.Suma  help "Iveskite uzsakymo suma!".
        Uzsakymas.Kodas = Klientas.Kodas.
        display Uzsakymas.Numeris Uzsakymas.Data Uzsakymas.Pavadinimas Uzsakymas.Suma.
    end.
end procedure.