
class keleivis:
    define variable busena as KeleivioBusena no-undo.
    define property svoris as decimal no-undo get. set.
    define variable esamasAukstas as integer  no-undo.
    define variable tikslas as integer no-undo.
    
    
    
    define variable laukimoLaikas as integer no-undo.
    
    
    constructor Keleivis():
        busena = KeleivioBusena:pastate. 
        svoris = random(60, 120).  
       
        
    end constructor.
    
    method public integer getEsamasAukstas():
        return esamasAukstas.
    end method.

    method public integer getTikslas():
        return tikslas.
    end method.

    method public decimal  getSvoris():
        return svoris.
    end method.
    
    method public integer getlaukimoLaikas():
        return laukimoLaikas.
    end method.

    
    method public void iskvieskLifta(liftas as Liftas):
        
       // define variable S as decimal no-undo. //svoris
        define variable A as integer no-undo. //aukðtas kuriame esa keleivis
        define variable Pa as integer no-undo. //Paskirties aukðtas

        update A label "Aukðtas kuriame esate" Pa label "Aukðtas á kurá norite kilti".


        if A > liftas:AukstuSkaicius
            then message "aukðtas kuriate esate neegzistuoja" view-as alert-box.

        else if Pa > liftas:AukstuSkaicius
            then message "aukðtas á kurá kilsite neegzistuoja" view-as alert-box.

        else if Pa = A
            then message "Jûs jau esate aukðte á kurá norite kilti" view-as alert-box.
        else do:
            assign
                esamasAukstas = A
                tikslas = Pa.
        //put unformatted substitute("Keleivis iðkvietë liftà á &1 aukðtà", esamasAukstas) skip(1).
        laukimoLaikas = liftas:atvaziuok(esamasAukstas).
        //put unformatted substitute("Liftas vaþiavo &1 sekundþiø",laukimoLaikas) skip(1).

        if laukimoLaikas <> 0 
        then busena = KeleivioBusena:laukia.
        
        liftas:atidarykDuris().
        end.
    end method.
    
    
    
    method public void persikelkIKitaAuksta(liftas as Liftas):
        iskvieskLifta(liftas).
        KeleivisIlipaILifta().
        liftas:uzdarykDuris().
        
        if liftas:patikrinkSvori(svoris)
            then do:
                laukimoLaikas = liftas:atvaziuok(tikslas).
                put unformatted substitute("Liftas vaþiavo &1 sekundþiø",laukimoLaikas) skip(1).
                esamasAukstas = tikslas.
            end.

        
        liftas:atidarykDuris().
        KeleivisIslipaIsLifto().
        liftas:TapkTuscias().
        liftas:uzdarykDuris().
        
    end method.
    
    
    
     method public void KeleivisIlipaILifta():
        if busena <> KeleivioBusena:lifte
            then do:
                busena = KeleivioBusena:lifte.
                put unformatted "Keleivis ilipa á liftà" skip(1).
            end.
    end method.
    
    
    method public void KeleivisIslipaIsLifto():
        if busena = KeleivioBusena:lifte
            then do:
                busena = KeleivioBusena:pastate.
                put unformatted "Keleivis iðlipa ið lifto" skip(1).
            end.
    end method.


    
end class.