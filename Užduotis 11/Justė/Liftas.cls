using Progress.Lang.*.

block-level on error undo, throw.

class Liftas: 
    
    define variable busena as LiftoBusena no-undo.
    define variable duruBusena as Durys no-undo.
    define variable paskirtiesAukstas as integer no-undo.
    define public property esamasAukstas as integer no-undo get. set.
    define variable minSvoris as integer no-undo.
    define variable maxSvoris as integer no-undo.
    define variable greitis as integer no-undo.     //Kiek laiko trunka nuva�iuoti 1 auk�t�.
    define public property maxAukstis as integer no-undo get. set.
    
    constructor Liftas(minSvoris as integer, maxSvoris as integer, greitis as integer):
        this-object:minSvoris = minSvoris.
        this-object:maxSvoris = maxSvoris.
        this-object:greitis = greitis.
        busena = LiftoBusena:laisvas.
        duruBusena = Durys:uzdarytos.
        esamasAukstas = 0.  /*Turi b�ti sugeneruotas pastato*/
        paskirtiesAukstas = ?.
        maxAukstis = 0.     /*Turi b�ti sugeneruotas pastato*/
    end.
    
    method public int atvaziuok(aukstas as integer):
        define variable laukimoLaikas as integer no-undo init 0.
        
        if busena = LiftoBusena:uzimtas
        then do:
            laukimoLaikas = laukimoLaikas + vazinekTarpAukstu().
        end.
        paskirtiesAukstas = aukstas. /*priskiriamas i�kvietusio keleivio paskirties auk�tas*/
        uzdarykDuris().             /*u�sidaro, jei prie� tai buvo i�kviestas bet nieks ne�lipo*/
        if esamasAukstas <> paskirtiesAukstas
        then do:
            laukimoLaikas = laukimoLaikas + vazinekTarpAukstu().
        end.
        return laukimoLaikas.
    end method.
    
    method public log patikrinkSvori(svoris as integer):
        if svoris < minSvoris or svoris > maxSvoris
        then return false.
        else return true.
    end method.
    
    method public void vezkKeleivi(paskirtiesAukstas as integer):
        this-object:paskirtiesAukstas = paskirtiesAukstas.
        busena = LiftoBusena:uzimtas.
        vazinekTarpAukstu().        /*kelion�s laikas kol kas nepanaudojamas*/
    end method.
    
    method public void atsilaisvink():
        busena = LiftoBusena:laisvas.
        put unformatted "Liftas i�tu�t�jo." skip.
    end method.
    
    /*gr��ina laik�, kiek trunka suva�in�t*/
    method private int vazinekTarpAukstu(): 
        define variable kryptis as integer no-undo.
        define variable temp as integer no-undo.
        define variable aukstuSkirtumas as integer no-undo.
        aukstuSkirtumas = abs(esamasAukstas - paskirtiesAukstas).
        
        if esamasAukstas > paskirtiesAukstas
        then kryptis = -1.
        else kryptis = 1.
       
        do while esamasAukstas <> paskirtiesAukstas:
            temp = esamasAukstas + kryptis.
            put unformatted substitute ("Liftas yra &1 auk�te, va�iuoja � &2.", esamasAukstas, temp) skip.
            esamasAukstas = temp.      
        end.
        
        put unformatted substitute ("Liftas atva�iavo � &1 auk�t� ir sustojo.", paskirtiesAukstas) skip.
        
        return aukstuSkirtumas * greitis.
    end method.
    
    method public void atidarykDuris():
        if duruBusena = Durys:uzdarytos 
        then do:
            put unformatted "Lifto durys atidaromos." skip.
            duruBusena = Durys:atidarytos.
        end.
    end method.
    
    method public void uzdarykDuris():
        if duruBusena = Durys:atidarytos
        then do:
            put unformatted "Lifto durys u�daromos." skip.
            duruBusena = Durys:uzdarytos.
        end.
    end method.
    
end class.