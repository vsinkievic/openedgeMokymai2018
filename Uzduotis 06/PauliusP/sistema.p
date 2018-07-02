 run prog_inicializacija.

procedure prog_inicializacija:
    define button btn-newClient label "Naujas klientas".
    define button btn-quit label "&Iðjungti programà"  auto-endkey.

    define query uzklausa for klientas scrolling.
    define browse interaktyvusLangas query uzklausa no-lock
 
    display klientas.kodas  klientas.pavadinimas  klientas.uzsakymuSuma  klientas.uzsakymuKiekis
    with 10 down no-assign expandable title "Klientø sàraðas".
 
    define frame remelis
        skip (1) interaktyvusLangas skip (1)
        btn-newClient btn-quit
        with no-box size 200 by 200.
 
    on choose of btn-newClient do:
        run naujas_klientas.
    end.

    on choose of btn-quit do:
        quit.
    end.

    display "Spauskite RETURN norëdami pamatyti daugiau informacijos apie tam tikrà klientà" 
    with size 70 by 2 centered.
    
    open query uzklausa for each klientas by uzsakymuSuma descending.
    enable all with frame remelis.
    
    
    READKEY.
    if lastkey = keycode ("RETURN")
        then do:
            run klientas_uzsakymai.
        end.
        
    apply "value-changed" to browse interaktyvusLangas.
    wait-for window-close of current-window.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure naujas_klientas:  //Naujo kliento ávedimas
    define frame naujamKlientui with centered title  "Naujo kliento ávedimo programa".
    define variable uzklausa as log no-undo init true.

    do while uzklausa <> false:
        do transaction:
            create klientas.
            update kodas label "ID" klientas.pavadinimas format "x(20)" label "Klientas" with frame naujamKlientui.
        end.
        update uzklausa label "Jûsø pasirinkimas" with centered title "Ávesti dar vienà klientà?".
    end.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure klientas_uzsakymai:  //Kliento uþsakymø duomenys
    define frame esamiKlientai with centered title  "Informacija apie esamà klientà" 1 col size 40 by 15 stream-io.
    define variable klientoNrPasirinkimas as integer no-undo.
    
        update klientoNrPasirinkimas label "Pasirinkite kliento numerá" with side-labels centered.   
        for first klientas no-lock where klientas.kodas = klientoNrPasirinkimas with frame esamiKlientai by uzsakymuSuma descending:
            display kodas label "ID" pavadinimas format "x(20)" label "Klientas" uzsakymuSuma label "Uþsakymø suma" uzsakymuKiekis label "Uþsakymø kiekis".
        end.

    define query uzklausa for uzsakymas scrolling.
    define browse interaktyvusLangas query uzklausa no-lock
        display uzsakymas.numeris uzsakymas.pavadinimas uzsakymas.kodas uzsakymas.data uzsakymas.suma
        with 10 down no-assign expandable title "Uþsakymai".
  
    define frame remelis
    skip (1) interaktyvusLangas skip(1)
        with no-box width 80.

   repeat:
        hide all.
        open query uzklausa for each uzsakymas where uzsakymas.kodas =  klientoNrPasirinkimas.
        display "Spauskite RETURN norëdami atnaujinti uþsakymo informacijà" SKIP
        "Spauskite CTRL-SHIFT-N arba CTRL-N norëdami sukurti naujà uþsakymà" SKIP
        "Spauskite CTRL-SHIFT-D arba CTRL-D norëdami iðtrinti uþsakymà" with size 70 by 5.
        enable all with frame remelis.
        
        readkey.
            if lastkey = keycode ("RETURN") then run uzsakymai_atnaujinimas.
            if lastkey = keycode ("ctrl-shift-n") OR lastkey = keycode ("ctrl-n") then run uzsakymai_kurimas /* (input klientas.kodas)*/ .
            if lastkey = keycode ("ctrl-shift-d") OR lastkey = keycode ("ctrl-d") then run uzsakymai_trynimas.
            if lastkey = keycode ("ESC") 
            then do:
                QUIT.
            end.
    hide all.
    end.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure uzsakymai_atnaujinimas:
    define variable uzsakymoNumerioKeitimas as integer no-undo.
    define frame keitimas with centered title  "Uþsakymo informacija"  side-labels 2 col width 50.

    update uzsakymoNumerioKeitimas label "Norimo pakeisti uþsakymo numeris" with centered side-labels.
    find uzsakymas exclusive-lock where uzsakymas.numeris = uzsakymoNumerioKeitimas no-error.
        if available uzsakymas 
            then do with frame keitimas:
                update pavadinimas format "x(20)" label "Apraðymas" suma label "Suma" kodas label "Kliento ID" data format "9999-99-99" label "Laikas".
                message "Duomenys teisingi, uþsakymo informacija atnaujinta" view-as alert-box title "Sistemos praneðimas".
            end.
        if not available uzsakymas
        then do:
            message "Uþsakymo su tokiu numeriu nëra" view-as alert-box title "Sistemos praneðimas".
        end.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure uzsakymai_trynimas:
    define variable salinamoUzsakymoNr as integer no-undo.

update salinamoUzsakymoNr label "Norimo paðalinti uþsakymo numeris" with side-labels.

find uzsakymas exclusive-lock where uzsakymas.numeris = salinamoUzsakymoNr no-error.
if available uzsakymas 
    then do:
            DELETE uzsakymas.
            message "Pasirinktas uþsakymas paðalintas ið sistemos" view-as alert-box title "Sistemos praneðimas".
    end.
if not available uzsakymas
    then do:
            message "Tokio uþsakymo nëra" view-as alert-box title "Sistemos praneðimas".
    end.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure uzsakymai_kurimas:
    define variable uzsakNr as integer no-undo.

    do transaction with 2 col centered title "Naujo uþsakymo duomenys" width 40:
        create uzsakymas. 
            display numeris label "Uþsakymo nr.". 
            update pavadinimas format "x(20)" label "Apraðymas" suma label "Suma" kodas label "Kliento ID" data format "9999-99-99" label "Laikas".
    end.
end procedure.