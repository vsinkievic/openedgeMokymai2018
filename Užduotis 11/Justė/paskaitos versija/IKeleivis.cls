
/*------------------------------------------------------------------------
    File        : IKeleivis
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 12:15:17 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/

using Progress.Lang.*.

interface IKeleivis:  
/*   define protected variable busena as KeleivioBusena no-undo.*/
    define public property svoris as integer no-undo get. set.
/*    define protected variable tikslas as integer no-undo.      */
/*    define protected variable esamasAukstas as integer no-undo.*/
/*    define protected variable laukimoLaikas as integer no-undo.*/
        
    method public void iskvieskLifta(liftas as Liftas).
    
    method public void persikelkIKitaAuksta(liftas as Liftas, tikslas as integer).
    
    method public void islipkIsLifto().  
end interface.