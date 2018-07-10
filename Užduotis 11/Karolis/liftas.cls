 
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

block-level on error undo, throw.

class uzduotis11.liftas: 
    
    
    define public property arLaisvas as logical no-undo get. set.
    define public property leistinasSvoris as decimal no-undo get. set.
    define public property arAtidarytos as logical no-undo get. set.
    define public property liftoAukstas as integer no-undo get. set.
    define public property aukstoTikslas as integer no-undo get. set.
    
    
    constructor public liftas(arLaisvas as logical, leistinasSvoris as decimal, arAtidarytos as logical,
                              liftoAukstas as integer):
        assign
           this-object:arLaisvas = arLaisvas
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
        
    method public logical arLeistinasSvoris(input klientoSvoris as integer):
        if klientoSvoris > leistinasSvoris
        then do: message "Per didelis svoris".
                 return false.
        end.         
        else do: message "Svoris geras".
                 return true.
        end.                  
    end method.       
    
    method public void vaziuokPasKlienta(input klientoAukstas as integer):
        
        if klientoAukstas = liftoAukstas
        then do: message "Liftas atvyko".
                 atidarykDuris().
                 uzdarykDuris().
        end.   
        
        else do:
            
            if klientoAukstas > liftoAukstas then do:
                repeat while klientoAukstas >= liftoAukstas:
                   message "esu" liftoAukstas "aukste".
                   liftoAukstas = liftoAukstas + 1.                
                end.   
                message "Atvaziavau".
                 atidarykDuris().
                 uzdarykDuris().
            end.  
            
             if klientoAukstas < liftoAukstas then do:
                repeat while klientoAukstas <= liftoAukstas:
                   message "esu" liftoAukstas "aukste".
                   liftoAukstas = liftoAukstas - 1.                
                end.   
                message "Atvaziavau".
             
            end.       
            
        end.          
    end method.
    
    method public void vezkKlienta(input klientoAukstass as integer):
        
          if klientoAukstass > liftoAukstas then do:
                repeat while klientoAukstass > liftoAukstas:
                   message "Esame" liftoAukstas + 1 "aukste".
                   liftoAukstas = liftoAukstas + 1.                
                end.   
                message "Atvykome i " liftoAukstas.
                
            end.  
            
             else do: 
                repeat while klientoAukstass < liftoAukstas:
                   message "Esame" liftoAukstas + 1 "aukste".
                   liftoAukstas = liftoAukstas - 1.                
                end.   
                message "Atvykome i " liftoAukstas.
            end.   
            
    end method.    

end class.