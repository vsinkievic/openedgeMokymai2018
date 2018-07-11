 
 /*------------------------------------------------------------------------
    File        : liftas
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Tue Jul 10 15:33:16 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.
using uzduotis11.liftoBusena from propath.
using uzduotis11.keleivis from propath.
using uzduotis11.keleivioBusena from propath.

block-level on error undo, throw.

class uzduotis11.liftas: 
    
    define public property busena as liftoBusena no-undo get. set.
    define public property leistinasSvoris as decimal no-undo get. set.
    define public property arAtidarytos as logical no-undo get. set.
    define public property liftoAukstas as integer no-undo get. set.
    define public property aukstoTikslas as integer no-undo get. set.
    define variable kryptis as integer no-undo.
    define variable temp as integer no-undo.
    
    constructor public liftas(leistinasSvoris as decimal, liftoAukstas as integer):
        assign
           this-object:busena = liftoBusena:laisvas
           this-object:leistinasSvoris = leistinasSvoris
           this-object:arAtidarytos = arAtidarytos
           this-object:liftoAukstas = liftoAukstas.

    end constructor.
    
    method public logical atidarykDuris():
        message "Durys atidarytos".
        arAtidarytos = true.
    end method.
    
    method public logical uzdarykDuris():
        message "Durys uzdarytos".
        arAtidarytos = false.
    end method.
        
    method public logical arLeistinasSvoris(klientoSvoris as integer):
        if klientoSvoris > leistinasSvoris
        then do: message "Per didelis svoris".
                 return false.
        end.         
        else do: message "Svoris geras".
                 return true.
        end.                  
    end method.       
    
    method public void vaziuokPasKlienta(klientas as keleivis):
        
        if klientas:esamasAukstas = liftoAukstas
        then do: message "Liftas atvyko".
                 atidarykDuris(). 
        end.   
        
        else do:
            
            if klientas:esamasAukstas < liftoAukstas
            then kryptis =  -1.
            else kryptis =   1.
            
            do while klientas:esamasAukstas <> liftoAukstas:
                 liftoAukstas = liftoAukstas + kryptis. 
                 message "Liftas yra" liftoAukstas "aukðte".              
            end.   
            message "Liftas atvyko".
            atidarykDuris().
               
        end.  
        
    end method.
    
    method public void vezkKlienta(klientas as keleivis):
        
        uzdarykDuris().
        if arLeistinasSvoris(klientas:keleivioSvoris) then do:
            if klientas:norimasAukstas > liftoAukstas then do:
                repeat while klientas:norimasAukstas > liftoAukstas:
                   message "Esame" liftoAukstas + 1 "aukðte".
                   liftoAukstas = liftoAukstas + 1.                
                end.   
                message "Atvykome á " liftoAukstas.
                atidarykDuris().
                klientas:esamasAukstas = liftoAukstas.
            end.  
            else do: 
                repeat while klientas:norimasAukstas < liftoAukstas:
                   message "Esame" liftoAukstas + 1 "aukðte".
                   liftoAukstas = liftoAukstas - 1.                
                end.   
                message "Atvykome á " liftoAukstas.
                atidarykDuris().
                klientas:esamasAukstas = liftoAukstas.
            end.   
        end.   
        else do:    
              message "Keleivio svoris yra netinkamas".
              atidarykDuris().
        end.   
            
    end method.    

end class.