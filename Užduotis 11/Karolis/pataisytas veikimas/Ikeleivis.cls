
/*------------------------------------------------------------------------
    File        : Ikeleivis
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : Studentas
    Created     : Wed Jul 11 15:02:37 EEST 2018
    Notes       : 
  ----------------------------------------------------------------------*/
using uzduotis11.liftas from propath.
using Progress.Lang.*.

interface uzduotis11.Ikeleivis:  
    
     method public void kvieskLifta(liftas as liftas, norimasAukstas as integer).
    
     method public void kelkisSuLiftu(liftas as liftas).
       
     method public void islipk().
    
     method public void ilipk(liftas as liftas).
  
end interface.