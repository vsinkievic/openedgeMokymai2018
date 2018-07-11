 
 /*------------------------------------------------------------------------
    File        : IKeleivis
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 17:18:03 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

block-level on error undo, throw.

interface IKeleivis: 
    define public property svoris as integer no-undo get.
    set.
    define public property tikslas as integer no-undo get.
    set.
    define public property esamas_aukstas as integer no-undo get.
    set.
    
    method public integer iskvieskLifta (as_liftas as class liftas).
    method public integer aukstoPakeitimas (as_liftas as liftas, as_pastatas as pastatas).
    method public void ilipk ().
    method public void islipk ().

end interface.