 
 /*------------------------------------------------------------------------
    File        : neigalusKeleivis
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 17:42:19 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

block-level on error undo, throw.

class neigalusKeleivis implements IKeleivis: 
    define variable keleivis as keleivis no-undo.

	define variable keleivio_busena as src.keleivioBusena no-undo.
    define public property svoris as integer no-undo get.
    set.
    define public property tikslas as integer no-undo get.
    set.
    define public property esamas_aukstas as integer no-undo get.
    set.  
    define public property vardas as character no-undo get.
    set.  
	 
    constructor public neigalusKeleivis (input esamas_aukstas as integer, input pasirinktas_aukstas as integer, input svoris as decimal, vardas as character):
       keleivis = new keleivis (esamas_aukstas, pasirinktas_aukstas, svoris). 
       this-object:vardas = vardas.
    end constructor.

	method public integer aukstoPakeitimas( input as_liftas as liftas, input as_pastatas as pastatas ):
/*        iskvieskLifta(as_liftas).                                         */
/*        ilipk().                                                          */
/*        as_liftas:vaziuok(tikslas, svoris, as_pastatas:maxKeliamasSvoris).*/
/*        esamas_aukstas = as_liftas:dabartinis_aukstas.                    */
/*        islipk().                                                         */
	end method.

	method public void ilipk():
        put unformatted substitute ("&1 álipo á liftà.", vardas) skip(1).
	end method.

	method public integer iskvieskLifta(input as_liftas as liftas ):
        as_liftas:atvaziuok(esamas_aukstas).
	end method.

	method public void islipk():
        put unformatted substitute ("&1 iðlipo ið lifto.", vardas) skip(1).
	end method.

end class.