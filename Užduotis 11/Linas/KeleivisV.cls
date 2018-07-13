USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS KeleivisV implements IKeleivis: 
   
    define public property vardas as character no-undo get. public set.
    define public property dabAukstas as integer no-undo get. public set.
    define public property svoris as integer no-undo get. public set.
    define public property tikslas as integer no-undo get. public set.
    define public property lifte as log no-undo get. public set.

    define variable keleivis as keleivis no-undo.
    define variable iAukstas as integer no-undo.
    
    constructor KeleivisV(vardas as character):
        keleivis = new keleivis().
        this-object:vardas = vardas.
        this-object:dabAukstas = keleivis:dabAukstas.
        this-object:svoris = keleivis:svoris.
        this-object:tikslas = keleivis:tikslas.
        put unformatted substitute("Pastate yra naujas keleivis, kurio vardas &1.", this-object:vardas) skip.
    end constructor.
    

	method public void ilipa(  ):
		keleivis:ilipa().
		put unformatted substitute("&1 áeina á liftà.", this-object:vardas) skip.
	END METHOD.

	METHOD PUBLIC VOID islipa(  ):
	    keleivis:islipa().
	    put unformatted substitute("&1 iðeina ið lifto &2 aukðte.", this-object:vardas, this-object:dabAukstas) skip.
	END METHOD.

	METHOD PUBLIC void kviecia( INPUT liftas AS liftas ):
	    keleivis:kviecia(liftas).
	    this-object:dabAukstas = keleivis:dabAukstas.
	    put unformatted substitute ("&2 kvieèia liftà á &1 aukðtà.", 
            keleivis:getDabAukstas(), this-object:vardas) skip.
	END METHOD.
	
	METHOD PUBLIC void kviecia(liftas1 as ismanusLiftas, liftas2 as ismanusLiftas):
        keleivis:kviecia(liftas1, liftas1).
        this-object:dabAukstas = keleivis:dabAukstas.
        put unformatted substitute ("&2 kvieèia liftà á &1 aukðtà.", 
            keleivis:getDabAukstas(), this-object:vardas) skip.

    END METHOD.
	
	

	METHOD PUBLIC INTEGER pasirenkaAuksta( INPUT aukstuSk AS INTEGER ):
		iAukstas = keleivis:pasirenkaAuksta(aukstuSk).
		this-object:tikslas = iAukstas.
        put unformatted substitute("&3 pasirenka vaþiuoti ið &1 á &2 aukðtà.", 
            keleivis:getDabAukstas(), keleivis:getTikslas(), this-object:vardas) skip.
        return keleivis:getTikslas().
	END METHOD.

	METHOD PUBLIC VOID vaziuoja(  ):
		keleivis:vaziuoja().
		
	END METHOD.
	
END CLASS.