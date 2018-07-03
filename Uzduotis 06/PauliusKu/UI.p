

RUN WINDOW_KLIENTAS.

/*---------------------------------------- PROCEDURES ----------------------------------------*/

PROCEDURE WINDOW_KLIENTAS:
    
/*    ------ Definitions ------*/
    DEFINE QUERY q-klientas FOR klientas SCROLLING.
    
    DEFINE BROWSE b-klientas QUERY q-klientas NO-LOCK DISPLAY klientas.kodas klientas.pavadinimas
            klientas.suma klientas.uzsakymu_kiekis
            WITH 15 DOWN NO-ASSIGN SEPARATORS.
    
    
    DEFINE SUB-MENU edit
        MENU-ITEM new_klientas LABEL "Naujas klientas"
        MENU-ITEM show_klientas LABEL "Šio kliento užsakymai".
        
    DEFINE MENU meniu MENUBAR
        SUB-MENU edit LABEL "Tvarkyti"
        MENU-ITEM exit_klientas LABEL "Išeiti iš programos" .
        
    DEFINE MENU meniu_blank MENUBAR.
    
    DEFINE FRAME f-klientas
            SKIP(1) SPACE(0) b-klientas SKIP(1) SPACE(8)
            WITH 1 COL TITLE "Klientai" center.
    
/*    ------ Actions ------*/

    ON CHOOSE OF MENU-ITEM new_klientas DO:
        HIDE ALL.
        ASSIGN CURRENT-WINDOW:MENUBAR = MENU meniu_blank:HANDLE.
        RUN CREATE_KLIENTAS.
        ASSIGN CURRENT-WINDOW:MENUBAR = MENU meniu:HANDLE.
        OPEN QUERY q-klientas FOR EACH klientas.
        ENABLE ALL WITH FRAME f-klientas.
    END.
    
    ON CHOOSE OF MENU-ITEM show_klientas DO:
         GET CURRENT q-klientas.
         FIND FIRST uzsakymas where uzsakymas.kodas = klientas.kodas NO-ERROR.
         HIDE ALL.
         ASSIGN CURRENT-WINDOW:MENUBAR = MENU meniu_blank:HANDLE.
         RUN WINDOW_UZSAKYMAS.
         ASSIGN CURRENT-WINDOW:MENUBAR = MENU meniu:HANDLE.
         ENABLE ALL WITH FRAME f-klientas.
    END.
    
    ON CHOOSE OF MENU-ITEM exit_klientas DO:
        message "Turėtų išeiti".
    END.

/*    ------ Main Body ------*/

    OPEN QUERY q-klientas FOR EACH klientas.
    ENABLE ALL WITH FRAME f-klientas.
    ASSIGN CURRENT-WINDOW:MENUBAR = MENU meniu:HANDLE.
    WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.
    
END.    

/*------------------------------------------*/

PROCEDURE WINDOW_UZSAKYMAS:
    
/*    ------ Definitions ------*/
    
    DEFINE QUERY q-uzsakymas FOR uzsakymas SCROLLING.
    DEFINE BROWSE b-uzsakymas QUERY q-uzsakymas NO-LOCK DISPLAY uzsakymas.numeris uzsakymas.pavadinimas
        uzsakymas.data uzsakymas.kaina uzsakymas.kodas
        WITH 15 DOWN NO-ASSIGN SEPARATORS.

    DEFINE SUB-MENU edit
        MENU-ITEM new_uzsakymas LABEL "Naujas užsakymas"
        MENU-ITEM update_uzsakymas LABEL "Keisti šį užsakymą"
        MENU-ITEM delete_uzsakymas LABEL "Ištrinti šį užsakymą".
        
    DEFINE MENU meniu MENUBAR
        SUB-MENU edit LABEL "Tvarkyti"
        MENU-ITEM exit_uzsakymas LABEL "Pereiti į klientas" .
    

    DEFINE FRAME f-uzsakymas
         SKIP(1) SPACE(0) b-uzsakymas SKIP(1) SPACE(8)
         WITH 1 COL TITLE "Klientai" center.
    
/*    ------ Actions ------*/
    
    ON CHOOSE OF MENU-ITEM new_uzsakymas DO:
        HIDE ALL.
        RUN CREATE_UZSAKYMAS.
        OPEN QUERY q-uzsakymas FOR EACH uzsakymas WHERE uzsakymas.kodas = klientas.kodas.
        ENABLE ALL WITH FRAME f-uzsakymas.
    END.
    
    ON CHOOSE OF MENU-ITEM update_uzsakymas DO:
        HIDE ALL.
        GET CURRENT q-uzsakymas.
        RUN UPDATE_UZSAKYMAS.
        ENABLE ALL WITH FRAME f-uzsakymas.
    END.
    
    ON CHOOSE OF MENU-ITEM delete_uzsakymas DO:
        GET CURRENT q-uzsakymas.
        delete uzsakymas.
        b-uzsakymas:DELETE-CURRENT-ROW () IN FRAME f-uzsakymas.
    END.
    
    ON CHOOSE OF MENU-ITEM exit_uzsakymas DO:
        HIDE ALL.
        LEAVE.
    END.
    
/*    ------ Main Body ------*/
    
    OPEN QUERY q-uzsakymas FOR EACH uzsakymas WHERE uzsakymas.kodas = klientas.kodas.
    
    ENABLE ALL WITH FRAME f-uzsakymas.
    ASSIGN CURRENT-WINDOW:MENUBAR = MENU meniu:HANDLE.
    WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.
    
END.

/*------------------------------------------*/


PROCEDURE CREATE_KLIENTAS:
    define variable temp-kodas as integer no-undo.
    
    define frame frame1 temp-kodas label "Kodas" skip
        klientas.pavadinimas label "Pavadinimas"
        with 1 col title "Naujas Klientas" center.
    define frame frame2 Klientas.Kodas label "Kodas" skip klientas.pavadinimas label "Pavadinimas" skip
        Klientas.Uzsakymu_kiekis label "Užs. kiekis" skip Klientas.suma label "Suma"
        with 1 col title "Naujas Klientas" center.
    
    
    do transaction:
        create klientas.
        update temp-kodas klientas.pavadinimas with frame frame1 no-error.
        if can-find (first klientas where klientas.kodas = temp-kodas)
            then do:
                 message "Toks klieto kodas jau yra. Bandykite įvesti dar kartą" view-as alert-box.
                 undo.
             end.
        else do:
             assign klientas.kodas = temp-kodas.
             hide frame frame1.
             display Klientas with frame frame2.
        end.
    end.
    HIDE ALL.
    
END.

/*------------------------------------------*/

PROCEDURE CREATE_UZSAKYMAS:
    
    define frame frame2 uzsakymas.numeris label "Numeris" skip uzsakymas.data label "Data" skip 
         uzsakymas.pavadinimas label "Pavadinimas" skip uzsakymas.kaina label "Kaina" skip 
         uzsakymas.kodas label "Kliento kodas" with 1 col title "Naujas užsakymas" center.
    
    do transaction:
        
        create uzsakymas.
        hide all.
        display klientas.kodas.
        update uzsakymas.data help "Įveskite užsakymo datą."
           uzsakymas.pavadinimas  help "Įveskite užsakymo pavadinimą."
           uzsakymas.kaina  help "Įveskite užsakymo sumą."
           with 1 col center no-error.
        if error-status:error then do:
           message ("Duomenys įvesti neteisingai!") view-as alert-box.
           undo, leave.
           
        end.
        else do:
           assign uzsakymas.kodas = klientas.Kodas.
           hide all.
           display uzsakymas with frame frame2.
        end.
        find klientas where klientas.kodas = uzsakymas.kodas no-error.
        if available klientas then klientas.uzsakymu_kiekis = klientas.uzsakymu_kiekis + 1.
    end.
    //HIDE ALL.
END.

/*------------------------------------------*/

PROCEDURE UPDATE_UZSAKYMAS:

    define frame frameN uzsakymas.numeris skip uzsakymas.data skip
                          uzsakymas.pavadinimas skip uzsakymas.kaina skip
                          uzsakymas.kodas label "Kliento kodas" with 1 col title "Pakeistas užsakymas" center.
    
    do transaction:
        update uzsakymas.data help "Įveskite data."
           uzsakymas.pavadinimas  help "Įveskite pavadinimą."
           uzsakymas.kaina  help "Įveskite sumą."
           with 1 col center no-error.
       if error-status:error then do:
           message ("Duomenys įvesti neteisingai!") view-as alert-box.
           undo, leave.
       end.
    end.
    
END.
