//PALEIDIMAS

run pagrindinis_langas. 

// BROWSE LANGAI

procedure pagrindinis_langas:
    
    define button btn-create label "Sukurti nauj� klient�".
    define button btn-quit label "&I�jungti" auto-endkey.
    
    define query QKlientas for klientas scrolling.
    define browse BKlientas query QKlientas no-lock
        display klientas.kodas 
        klientas.pavadinimas 
        klientas.bendras_uzsakymu_kiekis 
        klientas.bendra_uzsakymu_suma  
        with 10 down no-assign expandable title "Klient� lentel�".
        
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
define variable isOk as log no-undo.
    define input parameter pavadinimas as character no-undo.
    
    define query QUzsakymas for uzsakymas scrolling.
    define browse BUzsakymas query QUzsakymas no-lock
        display 
        uzsakymas.numeris 
        uzsakymas.data
        uzsakymas.pavadinimas
        uzsakymas.suma
        with 10 down no-assign expandable title "Kliento u�sakymai".
        
        define frame FUzsakymas 
             BUzsakymas with size 80 by 22.

        on default-action of browse BUzsakymas
        do:
            if available uzsakymas 
            then do:
                run redaguoti_uzsakyma. 
            end.
        end.
        
       on "Ctrl-n" of BUzsakymas do:  
            
            message "Naujas Uzsakymas" view-as alert-box.
            run sukurti_uzsakyma.
        end.
        
        on "Ctrl-D" of BUzsakymas do:  
            run naikinti_uzsakyma.
           
           
        end.
                
        
        find klientas where klientas.pavadinimas = pavadinimas.
        
        display klientas.
        
           
            open query QUzsakymas for each uzsakymas 
            where uzsakymas.pavadinimas = klientas.pavadinimas.
            enable all with frame FUzsakymas.
            apply "value-changed" to browse BUzsakymas.
            wait-for window-close of current-window.
            
   
            
        end procedure.

//NAUJO KLIENTO KURIMAS
procedure sukurti_klienta:
     
        
        
        define variable kodas as integer no-undo.
        define variable pavadinimas as character format "x(30)" no-undo.
        
        define frame ivedimas
        kodas label "Iveskite kliento kod�"
        pavadinimas label "Iveskite Kliento pavadinim�".
        
        display "Naujo kliento suk�rimas" with centered 1 col.
        
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
            message "Naujas klientas �ra�ytas!" view-as alert-box.
            run pagrindinis_langas.
            end.
end procedure.


//VEIKSMAI SUSIJ� SU U�SAKYMAIS
procedure sukurti_uzsakyma:
           
            
            define variable kodas as integer no-undo.
        define variable suma as decimal  no-undo.
         
         
         define frame ivedimas 
         kodas label "�veskite kliento kod�"
         suma label "�veskite u�sakymo sum�".
         
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
             message "Tokio kliento n�ra" view-as alert-box.
             end. 
        hide all.
        
         run uzsakymu_langas (input klientas.pavadinimas).
    end procedure.
    
    
procedure naikinti_uzsakyma:
            
            define variable numeris as integer no-undo.
        
        define frame ivedimas
        numeris label "�vesktie u�sakymo numeri kur� norite trinti".
        
        update numeris
        with frame ivedimas.
        
        find uzsakymas where uzsakymas.numeris = numeris no-error.
        if not available uzsakymas then message "Tokio u�sakymo n�ra".
        else do:
                display uzsakymas with 1 col.
                message "Ar tikrai norite i�trinti �� u�sakym�?" view-as alert-box
                question buttons yes-no update
                lOKtoDelete as logical.
                if lOKtoDelete then 
                do:
                    delete uzsakymas. 
                    message "U�sakymas i�trintas!" view-as alert-box.
                    
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
    label "U�sakymo numeris" 
    help "�veskite u�sakymo numer�"
    with side-labels.
    
    find uzsakymas where uzsakymas.numeris = oldnumeris exclusive-lock no-error.
        if not available uzsakymas 
        then message "Tokio u�sakymo n�ra" view-as alert-box.
            else do:
    
                update data suma
                with frame keitimas.
                
                uzsakymas.data = data.
                uzsakymas.suma = suma.
                
               display uzsakymas
               with frame apzvalga.
                                end.
     run uzsakymu_langas (input uzsakymas.pavadinimas).
 end procedure.