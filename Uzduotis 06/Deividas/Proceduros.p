//PALEIDIMAS

run pagrindinis_langas. 

// BROWSE LANGAI

procedure pagrindinis_langas:
    
    define button btn-create label "Sukurti naujà klientà".
    define button btn-quit label "&Iðjungti" auto-endkey.
    
    define query QKlientas for klientas scrolling.
    define browse BKlientas query QKlientas no-lock
        display klientas.kodas 
        klientas.pavadinimas 
        klientas.bendras_uzsakymu_kiekis 
        klientas.bendra_uzsakymu_suma  
        with 10 down no-assign expandable title "Klientø lentelë".
        
        define frame FKlientas
              skip (1) space (8)
              BKlientas
              skip(1) space (8) btn-create btn-quit
              with no-box width 300.
            
        on default-action of browse BKlientas do: 
            hide all.
            run uzsakymu_langas (input klientas.pavadinimas).
        end.
        
        on choose of btn-create do:
            hide all.  
            run sukurti_klienta.
        end.
        
        on choose of btn-quit do:
            quit.
        end.
        
        open query QKlientas for each klientas.
        enable all with frame FKlientas.
        apply "value-changed" to browse BKlientas.
        wait-for window-close of current-window.
    
end.

procedure uzsakymu_langas:

    define input parameter pavadinimas as character no-undo.
    
    define query QUzsakymas for uzsakymas scrolling.
    define browse BUzsakymas query QUzsakymas no-lock
        display 
        uzsakymas.numeris 
        uzsakymas.data
        uzsakymas.pavadinimas
        uzsakymas.suma
        with 10 down no-assign expandable title "Kliento uþsakymai".
        
        define frame FUzsakymas 
             BUzsakymas with size 80 by 22.

        on default-action of browse BUzsakymas
        do:
            if available uzsakymas 
            then do:
                run redaguoti_uzsakyma.
            end.
        end.
        
        find klientas where klientas.pavadinimas = pavadinimas.
        
        display klientas.
        MENIU:
            repeat:
            open query QUzsakymas for each uzsakymas 
            where uzsakymas.pavadinimas = klientas.pavadinimas.
            enable all with frame FUzsakymas.
            
            readkey.
            
            case lastkey:
  /*iðsiaiðkint*/when keycode("CTRL+N") then run sukurti_uzsakyma.
            when keycode("CTRL+D") then run naikinti_uzsakyma.
            
            end.
            leave MENIU.
            end.
        end procedure.
    
    
    


//NAUJO KLIENTO KURIMAS
procedure sukurti_klienta: 
    
        define variable kodas as integer no-undo.
        define variable pavadinimas as character format "x(30)" no-undo.
        
        define frame ivedimas
        kodas label "Iveskite kliento kodà"
        pavadinimas label "Iveskite Kliento pavadinimà".
        
        display "Naujo kliento sukûrimas" with centered 1 col.
        
        update kodas pavadinimas
        with frame ivedimas.
        
        find klientas where klientas.kodas = kodas or klientas.pavadinimas = pavadinimas no-error.
        if available klientas then do:
             message "Toks klientas jau yra!" view-as alert-box.
             hide all.
             run pagrindinis_langas.
             end.
        else do:
            create klientas.
            klientas.kodas = kodas.
            klientas.pavadinimas = pavadinimas.
            message "Naujas klientas áraðytas!" view-as alert-box.
            run pagrindinis_langas.
            end.
end procedure.


//VEIKSMAI SUSIJÆ SU UÞSAKYMAIS
procedure sukurti_uzsakyma:
    
            define variable kodas as integer no-undo.
        define variable suma as decimal  no-undo.
         
         
         define frame ivedimas 
         kodas label "Áveskite kliento kodà"
         suma label "Áveskite uþsakymo sumà".
         
         update kodas suma
         with frame ivedimas.
         
         find klientas where klientas.kodas = kodas no-lock no-error.
         if available klientas
         then do:
             create uzsakymas.
             uzsakymas.pavadinimas = klientas.pavadinimas.
             uzsakymas.suma = suma.
             uzsakymas.data = now.
             end.
         else do:
             message "Tokio kliento nëra" view-as alert-box.
             end. 
        hide all.
    end procedure.
    
    
procedure naikinti_uzsakyma:
    
            define variable numeris as integer no-undo.
        
        define frame ivedimas
        numeris label "Ávesktie uþsakymo numeri kurá norite trinti".
        
        update numeris
        with frame ivedimas.
        
        find uzsakymas where uzsakymas.numeris = numeris no-error.
        if not available uzsakymas then message "Tokio uþsakymo nëra".
        else do:
                display uzsakymas with 1 col.
                message "Ar tikrai norite iðtrinti ðá uþsakymà?" view-as alert-box
                question buttons yes-no update
                lOKtoDelete as logical.
                if lOKtoDelete then 
                do:
                    delete uzsakymas. 
                    message "Uþsakymas iðtrintas!" view-as alert-box.
                end.
            end.
            
 end procedure.
 
 procedure redaguoti_uzsakyma:
     
define variable suma as decimal  no-undo.
define variable data as date no-undo.
define variable oldnumeris as integer no-undo.

define frame keitimas 
     data label "Data" format "9999-99-99" skip
     suma label "Suma"
     with side-labels 1 col width 200.

define frame apzvalga
    uzsakymas.data skip
    uzsakymas.pavadinimas  skip
    uzsakymas.suma
    with side-labels 1 col width 100.
    
    update oldnumeris
    label "Uþsakymo numeris" 
    help "Áveskite uþsakymo numerá"
    with side-labels.
    
    find uzsakymas where uzsakymas.numeris = oldnumeris exclusive-lock no-error.
        if not available uzsakymas 
        then message "Tokio uþsakymo nëra" view-as alert-box.
            else do:
    
                update data suma
                with frame keitimas.
                
                uzsakymas.data = data.
                uzsakymas.suma = suma.
                
               display uzsakymas
               with frame apzvalga.
    
                end.
    
 end procedure.