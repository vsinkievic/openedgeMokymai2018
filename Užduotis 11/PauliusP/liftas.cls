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
        message "Auk�tas: " dabartinis_aukstas ".Liftas atva�iavo paimti j�s�" view-as alert-box.
    end method.

    method public integer vaziuok (input paskirties_aukstas as integer):
        dabartinis_aukstas = paskirties_aukstas.
        message "Auk�tas: " dabartinis_aukstas ".Liftas nuva�iavo".
    end method.
    
    method public logical atidarykDuris ():
        durys_uzdarytos = false.
        message "Auk�tas: " dabartinis_aukstas ".Liftas atva�iavo �" dabartinis_aukstas "auk�t� ir atsidar� durys" view-as alert-box.
        
    end method.
    
    method public logical uzdarykDuris ():
        durys_uzdarytos = true.
        message "Auk�tas: " dabartinis_aukstas ".Durys u�sidar�".
    end method.
end class.