
class Liftas:
    define variable busena as LiftoBusena no-undo.
    define variable durys as DuruBusena no-undo.
    define property aukstas as integer  no-undo get.
    public set.
    define property Paukstas as integer no-undo get.        //paskirties aukstas
    public set.
    define property AukstuSkaicius as integer no-undo get.
    private set.
    
    define property leistinasSvoris as decimal no-undo get. private set.
    define variable laikasVienamAukstui as integer no-undo init 5.
    
    constructor liftas(input maxAukstuSkaicius as integer, input maxSvoris as decimal):
        AukstuSkaicius = maxAukstuSkaicius.
        aukstas = random(1,maxAukstuSkaicius).
        leistinasSvoris = maxSvoris.
        busena = LiftoBusena:laisvas.          
        durys = DuruBusena:uzdarytos.
        put unformatted substitute("Liftas yra &1 aukðte", aukstas).
    end constructor.
    
    
    method public void atidarykDuris():
        if durys = DuruBusena:uzdarytos
            then do:
                durys = DuruBusena:atidarytos.
                put unformatted "durys atsidarë" skip(1).
            end.
    end method.
    
    
    method public void uzdarykDuris():
        if durys = DuruBusena:atidarytos
            then do:
                durys = DuruBusena:uzdarytos.
                put unformatted "durys uþsidarë" skip(1).
            end.
    end method.
    
    
    method public log patikrinkSvori(svoris as decimal):
           if svoris > leistinasSvoris
                then return(false).
           else return(true).
    end method.
    
    
    method private integer vaziuokTarpAukstu():
        
        define variable kryptis as integer no-undo.
        define variable temp as integer no-undo.
        define variable aukstuSkirtumas as integer no-undo.
        aukstuSkirtumas = aukstas - Paukstas.
        if aukstas > Paukstas
            then  kryptis = -1.
        else do: 
            kryptis = 1.
            aukstuSkirtumas = aukstuSkirtumas * (- 1).
        end.
            
        do while aukstas <> Paukstas:
            temp = aukstas + kryptis.
            put unformatted substitute ("Liftas &1 aukðte, vaþiuoja á &2.", aukstas, temp) skip.
            aukstas = temp.      
        end.
        
        put unformatted substitute ("Liftas atvaþiavo á &1 aukðtà ir sustojo.", Paukstas) skip.
        
        return aukstuSkirtumas * laikasVienamAukstui.
        
    end.

    
    method public integer atvaziuok(PaskirtiesAukstas as integer):
        
        define variable laukimoLaikas as integer no-undo init 0.
        
        if busena = LiftoBusena:uzimtas
        then do:
            laukimoLaikas = laukimoLaikas + vaziuokTarpAukstu().
        end.
        Paukstas = PaskirtiesAukstas. /*priskiriamas naujai iðkvietusio keleivio esamas aukstas*/
        
        if aukstas <> Paukstas
        then do:
            laukimoLaikas = laukimoLaikas + vaziuokTarpAukstu().
        end.
        return laukimoLaikas.
        
    end method.
    
    
    
    method public void TapkTuscias():
        busena = LiftoBusena:laisvas.
        put unformatted "Liftas tapo tuðèias" skip(1).
    end method.    
    
end class.