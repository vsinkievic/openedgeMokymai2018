

using Progress.Lang.*.

block-level on error undo, throw.


interface IKeleivis: 
       define property svoris as decimal no-undo get. set.
   
    method public integer getEsamasAukstas().
    method public integer getTikslas().
    method public decimal getSvoris().
    method public integer getlaukimoLaikas().
    method public void iskvieskLifta(liftas as Liftas).
    method public void persikelkIKitaAuksta(liftas as Liftas).
    method public void KeleivisIlipaILifta().
    method public void KeleivisIslipaIsLifto().
    

end interface.