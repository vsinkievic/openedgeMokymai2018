/*---------------------DEFINITIONS---------------------*/
define var cError as char no-undo.
define var kodas as character no-undo format "x(15)" label "Kodas".
define var pavadinimas as character no-undo format "x(15)" label "Pavadinimas".

define query q_K1 for Klientas.
define query q_U1 for Uzsakymas.

define browse b_K1 query q_K1 display Klientas.Kodas Klientas.Pavadinimas 
    enable Klientas.Pavadinimas
    with 9 down title "Klientø sàraðas" .
define browse b_K2 query q_U1 display Uzsakymas.Nr Uzsakymas.Data Uzsakymas.Pavadinimas Uzsakymas.Suma 
    enable all except Uzsakymas.Nr
    with 5 down title "Uþsakymø sàraðas".                                                    

define button bNew label "Naujas klientas".

define frame f_K1 b_K1 skip bNew with center.
define frame f_K2 Klientas.Kodas skip Klientas.Pavadinimas skip
                  UzsakymuKiekis skip UzsakymuSuma with row 12  1 col center title "Klientas".
define frame f_U1 b_K2 with row 17 center.

/*---------------------MAIN---------------------*/
on choose of bNew do:
    run naujasKlientas(output cError).
    if cError = "0" then message "Klientas sukurtas" view-as alert-box.
    else if cError = "1" then message "Klientas su tokiu kodu jau egzistuoja!" view-as alert-box.
end.

on value-changed of b_K1 do:
    display Klientas with frame f_K2.
    open query q_U1 for each Uzsakymas where Uzsakymas.Kodas = Klientas.Kodas.
    enable b_K2 with frame f_U1.    
end.

on "ctrl-n" of b_k2 do:
    run naujasUzsakymas(output cError).
    if cError <> "0" then message "Uþsakymo pridëti nepavyko!" view-as alert-box.
    else message "Pridëtas naujas uþsakymas." view-as alert-box.
end.

on "ctrl-d" of b_k2 do:
    run trintiUzsakyma(output cError).
    if cError = "0" then message "Uþsakymas iðtrintas" view-as alert-box.
    else message "Uþsakymo iðtrinti nepavyko." view-as alert-box.
end.

open query q_K1 for each Klientas.
enable b_K1 bNew with frame f_K1.
wait-for window-close of current-window.

/*-----------------INTERNAL PROCEDURES----------------*/
procedure naujasKlientas:
    define output parameter cError as character no-undo.
    define frame f_K3 Kodas skip pavadinimas with 1 col.
    
    update Kodas skip Pavadinimas with frame f_K3 view-as dialog-box.
    
    if can-find (first Klientas where Klientas.Kodas = kodas) or kodas = ""
    then cError = "1".
    else do transaction:
        create Klientas.
        assign Klientas.Kodas = kodas
               Klientas.Pavadinimas = pavadinimas.
       cError = "0".
       open query q_K1 for each Klientas.
   end.  
end procedure.
        
procedure naujasUzsakymas:
    define output parameter cError as character no-undo.
    do transaction:
        create Uzsakymas.
        update Uzsakymas.Data help "Áveskite uþsakymo datà."
                Uzsakymas.Pavadinimas  help "Áveskite uþsakymo pavadinimà."
                Uzsakymas.Suma  help "Áveskite uþsakymo sumà."
                with 1 col center no-error.
        if Uzsakymas.Data = ? or Uzsakymas.pavadinimas = "" or Uzsakymas.suma = 0  then do:
        cError = "1".
        undo, leave. 
        end.
        else do:
            assign Uzsakymas.Kodas = Klientas.Kodas.
            cError = "0".
            open query q_U1 for each Uzsakymas where Uzsakymas.Kodas = Klientas.Kodas.
        end.
   end.
end procedure.

procedure trintiUzsakyma:
    define output parameter cError as character no-undo.
    find current Uzsakymas exclusive-lock no-error.
    if error-status:error then cError = "1".
    else do:
        delete Uzsakymas.
        cError = "0".
    end.
    open query q_U1 for each Uzsakymas where Uzsakymas.Kodas = Klientas.Kodas.
end procedure.