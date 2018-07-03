 run prog_inicializacija.

procedure prog_inicializacija:
    define button btn-newClient label "Naujas klientas".
    define button btn-quit label "&I�jungti program�"  auto-endkey.

    define query uzklausa for klientas scrolling.
    define browse interaktyvusLangas query uzklausa no-lock
 
    display klientas.kodas  klientas.pavadinimas  klientas.uzsakymuSuma  klientas.uzsakymuKiekis
    with 10 down no-assign expandable title "Klient� s�ra�as".
 
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
    /*on value-changed of interaktyvusLangas do:*/
    on "Ctrl" of interaktyvusLangas do:
        display "ssdsssss".
    end.
   /* end.*/
    display "Spauskite RETURN nor�dami pamatyti daugiau informacijos apie tam tikr� klient�" 
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
    on "Ctrl" of interaktyvusLangas do:
        message "ssdsssss".
    end.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure naujas_klientas:  //Naujo kliento �vedimas
    define frame naujamKlientui with centered title  "Naujo kliento �vedimo programa".
    define variable uzklausa as log no-undo init true.

    do while uzklausa <> false:
        do transaction:
            create klientas.
            update kodas label "ID" klientas.pavadinimas format "x(20)" label "Klientas" with frame naujamKlientui.
        end.
        update uzklausa label "J�s� pasirinkimas" with centered title "�vesti dar vien� klient�?".
    end.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure klientas_uzsakymai:  //Kliento u�sakym� duomenys
    define frame esamiKlientai with centered title  "Informacija apie esam� klient�" 1 col size 40 by 15 stream-io.
    define variable klientoNrPasirinkimas as integer no-undo.
    
        update klientoNrPasirinkimas label "Pasirinkite kliento numer�" with side-labels centered.   
        for first klientas no-lock where klientas.kodas = klientoNrPasirinkimas with frame esamiKlientai by uzsakymuSuma descending:
            display kodas label "ID" pavadinimas format "x(20)" label "Klientas" uzsakymuSuma label "U�sakym� suma" uzsakymuKiekis label "U�sakym� kiekis".
        end.

    define query uzklausa for uzsakymas scrolling.
    define browse interaktyvusLangas query uzklausa no-lock
        display uzsakymas.numeris uzsakymas.pavadinimas uzsakymas.kodas uzsakymas.data uzsakymas.suma
        with 10 down no-assign expandable title "U�sakymai".
  
    define frame remelis
    skip (1) interaktyvusLangas skip(1)
        with no-box width 80.

   repeat:
        hide all.
        open query uzklausa for each uzsakymas where uzsakymas.kodas =  klientoNrPasirinkimas.
        display "Spauskite RETURN nor�dami atnaujinti u�sakymo informacij�" SKIP
        "Spauskite CTRL-SHIFT-N arba CTRL-N nor�dami sukurti nauj� u�sakym�" SKIP
        "Spauskite CTRL-SHIFT-D arba CTRL-D nor�dami i�trinti u�sakym�" with size 70 by 5.
        enable all with frame remelis.
        
        
        on value-changed of interaktyvusLangas do:
            readkey.
                if lastkey = keycode ("RETURN") then run uzsakymai_atnaujinimas.
                if lastkey = keycode ("ctrl-shift-n") OR lastkey = keycode ("ctrl-n") then run uzsakymai_kurimas /* (input klientas.kodas)*/ .
                if lastkey = keycode ("ctrl-shift-d") OR lastkey = keycode ("ctrl-d") then run uzsakymai_trynimas.
                if lastkey = keycode ("ESC") 
                then do:
                    QUIT.
                end.
        end.
    hide all.
    end.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure uzsakymai_atnaujinimas:
    define variable uzsakymoNumerioKeitimas as integer no-undo.
    define frame keitimas with centered title  "U�sakymo informacija"  side-labels 2 col width 50.

    update uzsakymoNumerioKeitimas label "Norimo pakeisti u�sakymo numeris" with centered side-labels.
    find uzsakymas exclusive-lock where uzsakymas.numeris = uzsakymoNumerioKeitimas no-error.
        if available uzsakymas 
            then do with frame keitimas:
                update pavadinimas format "x(20)" label "Apra�ymas" suma label "Suma" kodas label "Kliento ID" data format "9999-99-99" label "Laikas".
                message "Duomenys teisingi, u�sakymo informacija atnaujinta" view-as alert-box title "Sistemos prane�imas".
            end.
        if not available uzsakymas
        then do:
            message "U�sakymo su tokiu numeriu n�ra" view-as alert-box title "Sistemos prane�imas".
        end.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure uzsakymai_trynimas:
    define variable salinamoUzsakymoNr as integer no-undo.

update salinamoUzsakymoNr label "Norimo pa�alinti u�sakymo numeris" with side-labels.

find uzsakymas exclusive-lock where uzsakymas.numeris = salinamoUzsakymoNr no-error.
if available uzsakymas 
    then do:
            DELETE uzsakymas.
            message "Pasirinktas u�sakymas pa�alintas i� sistemos" view-as alert-box title "Sistemos prane�imas".
    end.
if not available uzsakymas
    then do:
            message "Tokio u�sakymo n�ra" view-as alert-box title "Sistemos prane�imas".
    end.
end procedure.

/* ------------------------------------------------------------------------------------------------------------------------------- */

procedure uzsakymai_kurimas:
    define variable uzsakNr as integer no-undo.

    do transaction with 2 col centered title "Naujo u�sakymo duomenys" width 40:
        create uzsakymas. 
            display numeris label "U�sakymo nr.". 
            update pavadinimas format "x(20)" label "Apra�ymas" suma label "Suma" kodas label "Kliento ID" data format "9999-99-99" label "Laikas".
    end.
end procedure.