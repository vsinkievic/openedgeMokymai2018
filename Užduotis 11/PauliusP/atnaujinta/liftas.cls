Using progress.lang.*.
using src.duruBusena from propath.
using src.liftoBusena from propath.

block-level on error undo, throw.

class liftas:
    
    define variable lifto_busena as src.liftoBusena no-undo.
    define variable duru_busena as src.duruBusena no-undo.
    define variable paskirties_aukstas as integer no-undo.
    define public property dabartinis_aukstas as integer no-undo get.
        set.
    define public property esamas_aukstas as integer no-undo get. 
        set.
    define variable maxSvoris as decimal no-undo.
    define public property maxAukstis as integer no-undo get. 
        set.

    constructor liftas(maxAukstis as integer, maxSvoris as decimal):
        dabartinis_aukstas = random (1,maxAukstis).
        lifto_busena = src.liftoBusena:laisvas.
        duru_busena = src.duruBusena:uzdarytos.
        paskirties_aukstas = ?.
        this-object:maxAukstis = maxAukstis.
        this-object:maxSvoris = maxSvoris.
    end constructor.

    method public integer atvaziuok (zmogausBuvimoAukstas as integer):
        uzdarykDuris().
        dabartinis_aukstas = zmogausBuvimoAukstas.
        put unformatted "Liftas atvaþiuoja." skip(1).
        atidarykDuris().
        put unformatted "Liftas yra keleivio(" dabartinis_aukstas ")aukðte." skip(1).
    end method.

    method public integer vaziuok (paskirties_aukstas as integer, krovinioSvoris as decimal, maxKeliamasSvoris as decimal):
        if krovinioSvoris < maxKeliamasSvoris
            then do:
                if paskirties_aukstas < maxAukstis
                    then do:
                        uzdarykDuris().
                        lifto_busena = liftoBusena:naudojamas.
                        put unformatted substitute ("Liftas vaþiuoja á &1 aukðtà.", paskirties_aukstas) skip(1).
                        dabartinis_aukstas = paskirties_aukstas.
                        put unformatted substitute ("Liftas atvaþiavo á &1 aukðtà.", dabartinis_aukstas) skip(1).
                        atidarykDuris().
                        lifto_busena = liftoBusena:laisvas.
                    end.
                    else do:
                        put unformatted paskirties_aukstas "Tokio aukðto nëra!" maxAukstis skip(1).
                    end.
            end.
            else do:
                put unformatted substitute ("Krovinio svoris yra &1kg., lifto maksimalus keliamas svoris yra &2. Sumaþinkite svorá.", 
                krovinioSvoris, maxKeliamasSvoris) skip(1).
            end.
    end method.
    
    method public void atidarykDuris ():
        if duru_busena = duruBusena:uzdarytos
        then do:
            put unformatted "Lifto durys atsidaro." skip(1).   
            duru_busena = duruBusena:atidarytos.
        end.
    end method.
    
    method public void uzdarykDuris ():
        if duru_busena = duruBusena:atidarytos
        then do:
            put unformatted "Lifto durys uþsidaro." skip(1).   
            duru_busena = duruBusena:uzdarytos.
        end.
    end method.
    
end class.