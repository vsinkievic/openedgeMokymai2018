DEFINE QUERY q-klientas FOR klientas SCROLLING.

DEFINE BROWSE b-klientas QUERY q-klientas NO-LOCK DISPLAY klientas.kodas klientas.pavadinimas
        klientas.suma klientas.uzsakymu_kiekis
        WITH 5 DOWN NO-ASSIGN SEPARATORS.


DEFINE QUERY q-uzsakymas FOR uzsakymas SCROLLING.
DEFINE BROWSE b-uzsakymas QUERY q-uzsakymas NO-LOCK DISPLAY uzsakymas.numeris uzsakymas.pavadinimas
    uzsakymas.data uzsakymas.kaina uzsakymas.kodas
    WITH 8 DOWN NO-ASSIGN SEPARATORS.
    
/*define button butClientOK label "OK" auto-go.             */
/*define button butClientCancel label "Cancel" auto-end-key.*/
define variable isOk as log no-undo.

DEFINE FRAME f-main
             b-klientas SKIP(2) 
             b-uzsakymas
            WITH 1 COL TITLE "Klientai" center.


define frame f-client
        klientas.kodas label "Kodas" skip
        klientas.pavadinimas label "Pavadinimas" skip
  //      butClientCancel butClientOK
        with 1 col title "Naujas Klientas" centered view-as dialog-box.

on value-changed of b-klientas do:  
    run refresh-uzsakymai.
    message "value-changed of klientas" klientas.kodas klientas.pavadinimas.
end.

on "Ctrl-n" of b-klientas do:  
    
    message "New of klientas" view-as alert-box.
    run create_klientas (output isOk).
    if isOK 
    then run refresh-klientas.
    else return no-apply.
end.

on "Ctrl-D" of b-klientas do:  
    run delete_klientas (output isOk).
    if isOK 
    then run refresh-klientas.
    else return no-apply.
end.

on "return" of b-klientas do:  
    run update_klientas (output isOk).
    if isOK 
    then run refresh-klientas.
    else return no-apply.
end.

on "return" of b-uzsakymas do:  
    message "return of uzsakymas" uzsakymas.pavadinimas.
/*    run update_klientas (output isOk).*/
/*    if isOK                           */
/*    then run refresh-klientas.        */
/*    else return no-apply.             */
end.


/*on choose of butClientOK in frame f-client do:        */
/*    message "go of f-client" view-as alert-box.       */
/*                                                      */
/*end.                                                  */
/*                                                      */
/*on choose of butClientCancel in frame f-client do:    */
/*    message "end-error if f-client" view-as alert-box.*/
/*end.                                                  */

// MAIN BLOCK 

 //   OPEN QUERY q-klientas FOR EACH klientas.
    run refresh-klientas.
    ENABLE ALL WITH FRAME f-main.
   // ASSIGN CURRENT-WINDOW:MENUBAR = MENU meniu:HANDLE.
    WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.


procedure refresh-klientas: 
    close QUERY q-klientas .
    OPEN QUERY q-klientas FOR EACH klientas.

    browse b-klientas:refresh() no-error.
    
    run refresh-uzsakymai.
end.

procedure refresh-uzsakymai: 
    
    close query q-uzsakymas.
    open query q-uzsakymas 
        for each uzsakymas no-lock where uzsakymas.kodas = klientas.kodas.
    browse b-uzsakymas:refresh() no-error.
end.



/*procedure refresh-uzsakymai:                                                          */
/*     OPEN QUERY q-uzsakymas FOR EACH uzsakymas WHERE uzsakymas.kodas = klientas.kodas.*/
/*                                                                                      */
/*    ENABLE ALL WITH FRAME f-uzsakymas.                                                */
/*    ASSIGN CURRENT-WINDOW:MENUBAR = MENU meniu:HANDLE.                                */
/*    WAIT-FOR WINDOW-CLOSE OF CURRENT-WINDOW.                                          */
/*                                                                                      */
/*end.                                                                                  */

/*
RUN WINDOW_KLIENTAS.

/*---------------------------------------- PROCEDURES ----------------------------------------*/

PROCEDURE WINDOW_KLIENTAS:
    
/*    ------ Definitions ------*/
    
    
    DEFINE SUB-MENU edit
        MENU-ITEM new_klientas LABEL "Naujas klientas"
        MENU-ITEM show_klientas LABEL "Šio kliento užsakymai".
        
    DEFINE MENU meniu MENUBAR
        SUB-MENU edit LABEL "Tvarkyti"
        MENU-ITEM exit_klientas LABEL "Išeiti iš programos" .
        
    DEFINE MENU meniu_blank MENUBAR.
    
    
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
*/
/*------------------------------------------*/


PROCEDURE CREATE_KLIENTAS:
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
    
END.

PROCEDURE update_KLIENTAS:
    define output parameter isOk as log init false no-undo.
    do transaction:
        find current klientas exclusive-lock.
        display klientas.kodas with frame f-client.
        update klientas.pavadinimas with frame f-client.
        find current klientas no-lock.     
        isOK = true.
    end.
    hide frame f-client.
    
END.

PROCEDURE delete_KLIENTAS:
    define output parameter isOk as log init false no-undo.
    
    define variable isConfirmed as log no-undo init false.
    message "Ar tikrai norite ištrinti" view-as alert-box question 
        buttons yes-no-cancel update isConfirmed.
    if isConfirmed then do transaction:
        find current klientas exclusive-lock.
        delete klientas.
        isOK = true.
    end.
    hide frame f-client.
    
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
