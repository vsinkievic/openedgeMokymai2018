
USING Progress.Lang.*.

INTERFACE IKeleivis:  
    define public property dabAukstas as integer no-undo get.
    public set.
    define public property tikslas as integer no-undo get.
    public set.
    define public property lifte as log no-undo get.
    public set.
    define public property svoris as integer no-undo get.
    public set.


   
    method public void kviecia(liftas as liftas).
    method public void kviecia(liftas1 as ismanusLiftas, liftas2 as ismanusLiftas).
    method public integer pasirenkaAuksta(aukstuSk as integer).    
    method public void ilipa().
    method public void islipa().
    method public void vaziuoja().
  
  
END INTERFACE.