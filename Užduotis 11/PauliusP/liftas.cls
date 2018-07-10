Using progress.lang.*.

block-level on error undo, throw.

class liftas:
    define variable as_keleivis as class keleivis no-undo.
    define public property liftas_uzimtas as logical no-undo get.
        private set.
    define public property durys_uzdarytos as logical no-undo get.
        private set.
    define public property paskirties_aukstas as integer no-undo get.
    define public property dabartinis_aukstas as integer no-undo init 1 get.
    set.
    
    /*procedure public liftas ():
        liftas_uzimtas = false.
         
    end procedure.*/
    
    method public integer atvaziuok (input pasikeitimo_aukstas as integer):
        dabartinis_aukstas = pasikeitimo_aukstas.
        message "Aukðtas: " dabartinis_aukstas ".Liftas atvaþiavo paimti jûsø" view-as alert-box.
    end method.

    method public integer vaziuok (input paskirties_aukstas as integer):
        dabartinis_aukstas = paskirties_aukstas.
        message "Aukðtas: " dabartinis_aukstas ".Liftas nuvaþiavo".
    end method.
    
    method public logical atidarykDuris ():
        durys_uzdarytos = false.
        message "Aukðtas: " dabartinis_aukstas ".Liftas atvaþiavo á" dabartinis_aukstas "aukðtà ir atsidarë durys" view-as alert-box.
        
    end method.
    
    method public logical uzdarykDuris ():
        durys_uzdarytos = true.
        message "Aukðtas: " dabartinis_aukstas ".Durys uþsidarë".
    end method.
end class.