
class keleivis:
    define property busena as logical no-undo get.
    public set.
    define property svoris as decimal no-undo get.
    public set.
    define property aukstas as integer  no-undo get.
    public set.
    define property Paukstas as integer no-undo get.        //paskirties aukstas
    public set.
    
    define variable S as decimal no-undo. //svoris
    define variable A as integer no-undo. //aukðtas kuriame esa keleivis
    define variable Pa as integer no-undo. //Paskirties aukðtas
    
    
    constructor keleivis(input maxAukstas as integer, input maxSvoris as decimal ):
        
        busena = false.         //False keleivis nëra lifte, jei true yra lifte
        update S label "Keleivio svoris" A label "Aukðtas kuriame esate" Pa label "Aukðtas á kurá norite kilti".
        
        if S > maxSvoris 
            then message "Jûsø svoris (" S ") didesnis uþ leistinà (" maxSvoris ")" view-as alert-box.
            
        else if A > maxAukstas 
            then message "aukðtas kuriate esate neegzistuoja" view-as alert-box.
            
        else if Pa > maxAukstas 
            then message "aukðtas á kurá kilsite neegzistuoja" view-as alert-box.
        
        else if Pa = A 
            then message "Jûs jau esate aukðte á kurá norite kilti" view-as alert-box.
        else assign
            svoris = S
            aukstas = A
            Paukstas = Pa.
            
    end constructor.
    
    
    method public int iskvieskLifta():
        message "Keleivis iðkvietë liftà á" aukstas "aukðtà".
        return aukstas.
    end method.
    
     method public void Lifte():
        if busena = true
            then do:
                busena = false.
                message "Keleivis iðlipo ið lifto".
                aukstas = Paukstas.
            end.
        else 
            do:
                busena = true.
                message "Keleivis álipo á liftà".
            end.
    end method.
    


    
end class.