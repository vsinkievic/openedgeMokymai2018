 
 /*------------------------------------------------------------------------
    File        : keleivisTurintisVarda
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 17:41:23 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

block-level on error undo, throw.

class keleivisTurintisVarda implements IKeleivis: 
    
    define variable keleivis as keleivis no-undo.
    define public property svoris as integer no-undo get.
    set.
    define public property tikslas as integer no-undo get.
    set.
    define public property esamas_aukstas as integer no-undo get.
    set.  
    define public property vardas as character no-undo get.
    set.  
     
    constructor keleivisTurintisVarda (input esamas_aukstas as integer, input pasirinktas_aukstas as integer, input svoris as decimal, vardas as character):
       keleivis = new keleivis (esamas_aukstas, pasirinktas_aukstas, svoris). 
       this-object:vardas = vardas.
       this-object:esamas_aukstas = esamas_aukstas.
       this-object:svoris = svoris.
       this-object:tikslas = pasirinktas_aukstas.
    end constructor.

    method public integer aukstoPakeitimas(input as_liftas as liftas, input as_pastatas as pastatas):
        keleivis:aukstoPakeitimas(as_liftas, as_pastatas).
        esamas_aukstas = as_liftas:dabartinis_aukstas.
    end method.

    method public void ilipk():
        keleivis:ilipk().
        put unformatted substitute ("&1 álipo á liftà.", vardas) skip(1).
    end method.

    method public integer iskvieskLifta(input as_liftas as liftas):
        keleivis:iskvieskLifta(as_liftas).
    end method.

    method public void islipk():
        keleivis:islipk().
        put unformatted substitute ("&1 iðlipo ið lifto.", vardas) skip(1).
    end method.

end class.