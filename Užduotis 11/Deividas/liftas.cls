
class liftas:
    define property busena as logical no-undo get.
    public set.
    define property durys as logical no-undo get.
    public set.
    define property aukstas as integer  no-undo get.
    public set.
    define property Paukstas as integer no-undo get.        //paskirties aukstas
    public set.
    
    define variable laikas as integer no-undo.
    
    constructor liftas(input maxAukstas as integer):
        aukstas = random(1,maxAukstas).
        busena = true.          //busena true tai laisvas liftas
        durys = true.           //durys true tai uþdarytos
        
    end constructor.
    
    method public void atidarykDuris():
        if durys = true
            then do:
                durys = false.
                message "durys atsidarë".
            end.
        else 
            do:
                durys = true.
                message "durys uzsidarë".
            end.
    end method.
    
    
    method public void atvaziuok(input PaskirtiesA as integer, input suKeleiviu as logical):
       
        if suKeleiviu 
            then atidarykDuris().
        
        Paukstas = PaskirtiesA.
        laikas = abs((aukstas - Paukstas)) * 5.             //aukðta nuvaþiuoti reikia 5 sekundziu
        
            if laikas = 0
                then message "Liftas tame paèiame aukðte, laukti nereikia".
            else message "Liftas" aukstas "aukðte, laukite" laikas "sekundþiø".
            
            aukstas = Paukstas.
            
        message "Liftas atvaþiavo á " aukstas "aukðtà".
            
        atidarykDuris().
         
    end method.
    
end class.