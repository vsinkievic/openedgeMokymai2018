
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
        define variable A as integer no-undo. //auk�tas kuriame esa keleivis
        define variable Pa as integer no-undo. //Paskirties auk�tas

        update A label "Auk�tas kuriame esate" Pa label "Auk�tas � kur� norite kilti".


        if A > liftas:AukstuSkaicius
            then message "auk�tas kuriate esate neegzistuoja" view-as alert-box.

        else if Pa > liftas:AukstuSkaicius
            then message "auk�tas � kur� kilsite neegzistuoja" view-as alert-box.

        else if Pa = A
            then message "J�s jau esate auk�te � kur� norite kilti" view-as alert-box.
        else do:
            assign
                esamasAukstas = A
                tikslas = Pa.
        //put unformatted substitute("Keleivis i�kviet� lift� � &1 auk�t�", esamasAukstas) skip(1).
        laukimoLaikas = liftas:atvaziuok(esamasAukstas).
        //put unformatted substitute("Liftas va�iavo &1 sekund�i�",laukimoLaikas) skip(1).

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
                put unformatted substitute("Liftas va�iavo &1 sekund�i�",laukimoLaikas) skip(1).
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
                put unformatted "Keleivis ilipa � lift�" skip(1).
            end.
    end method.
    
    
    method public void KeleivisIslipaIsLifto():
        if busena = KeleivioBusena:lifte
            then do:
                busena = KeleivioBusena:pastate.
                put unformatted "Keleivis i�lipa i� lifto" skip(1).
            end.
    end method.


    
end class.