    define variable isOk as log no-undo.

    define button btn-newClient label "Naujas klientas".

    define query k-uzklausa for klientas scrolling.
    define browse k-interaktyvusLangas query k-uzklausa no-lock display klientas.kodas  klientas.pavadinimas  
        klientas.uzsakymuSuma  klientas.uzsakymuKiekis
        with 10 down no-assign separators.
    
    define query u-uzklausa for uzsakymas scrolling.
    define browse  u-interaktyvusLangas query u-uzklausa no-lock display uzsakymas.numeris uzsakymas.pavadinimas
        uzsakymas.data uzsakymas.suma uzsakymas.kodas
        with 6 down no-assign separators.
 
    define frame remelis
        skip (1) k-interaktyvusLangas skip (1)
        u-interaktyvusLangas skip (1)
        btn-newClient
        with 1 col title "Klientai" center.
        
 define frame f-client
        klientas.kodas label "Kodas" skip
        klientas.pavadinimas label "Pavadinimas" skip
        with 2 col title "Naujas Klientas" centered view-as dialog-box.

 define frame f-uzs
        uzsakymas.kodas label "Kodas" skip
        uzsakymas.numeris label "Numeris" skip
        uzsakymas.pavadinimas label "Pavadinimas" skip
        uzsakymas.suma label "Suma" skip
        uzsakymas.data label "Data" skip
        with 5 col title "Naujas Klientas" centered view-as dialog-box.
        
    on choose of btn-newClient do:
        run naujas_klientas.
    end.
    
on value-changed of k-interaktyvusLangas do:  
    run atnaujinti_uzsakymus.
end.

on "Ctrl-n" of k-interaktyvusLangas do:
    run naujas_klientas (output isOk).
    if isOK 
    then run atnaujinti_klientus.
    else return no-apply.
end.

on "Ctrl-n" of u-interaktyvusLangas do:
    run uzsakymai_kurimas.
    run atnaujint_uzsakymus.
end.

on "Ctrl-d" of u-interaktyvusLangas do:  
    run uzsakymai_trynimas.
    run atnaujint_uzsakymus.
end.

on "return" of u-interaktyvusLangas do:
    run uzsakymai_atnaujinimas.
    run atnaujinti_uzsakymus.
end. 

run atnaujinti_klientus.
enable all with frame remelis.
wait-for window-close of current-window.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure atnaujinti_klientus: 
    close QUERY k-uzklausa.
    OPEN QUERY k-uzklausa FOR EACH klientas.
    browse k-interaktyvusLangas:refresh() no-error.
end.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure atnaujinti_uzsakymus: 
    close query u-uzklausa.
    open query u-uzklausa 
        for each uzsakymas no-lock where uzsakymas.kodas = klientas.kodas.
    browse k-interaktyvusLangas:refresh() no-error.
end.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure naujas_klientas: 
 define buffer bKlientas for klientas.
    define output parameter isOk as log init false no-undo.
    do transaction:
        create klientas.
        update klientas.kodas klientas.pavadinimas 
            with frame f-client.
             
        if can-find(bKlientas where bKlientas.kodas = klientas.kodas 
                    and rowid(bKlientas) <> rowid(klientas))
        then do: 
            message "Klientas su tokiu kodu jau yra" view-as alert-box error.
            undo, retry.
        end.              
        isOK = true.
    end.
    hide frame f-client.
end.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure uzsakymai_trynimas:
    define variable isConfirmed as log no-undo init false.
    message "Ar tikrai norite iðtrinti" view-as alert-box question 
        buttons yes-no-cancel update isConfirmed.
    if isConfirmed then do transaction:
        find current uzsakymas exclusive-lock.
        delete uzsakymas.
        message "Uþsakymas iðtrintas" view-as alert-box.
        run uzsakymai_atnaujinimas.
    end.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure uzsakymai_atnaujinimas:
    do transaction:
        find current uzsakymas exclusive-lock.
        display uzsakymas.kodas with frame f-uzs.
        display uzsakymas.numeris with frame f-uzs.    
        update uzsakymas.pavadinimas with frame f-uzs.
        update uzsakymas.data  with frame f-uzs.
        update uzsakymas.suma with frame f-uzs.
        find current uzsakymas no-lock.
    end.
    hide frame f-uzs.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure uzsakymai_kurimas:
    define variable uzsakNr as integer no-undo.

    do transaction with 2 col centered title "Naujo uþsakymo duomenys" width 40:
        create uzsakymas. 
            display numeris label "Uþsakymo nr.". 
            update pavadinimas format "x(20)" label "Apraðymas" suma label "Suma" klientas.kodas label "Kliento ID" data format "9999-99-99" label "Laikas".
    end.
end procedure.