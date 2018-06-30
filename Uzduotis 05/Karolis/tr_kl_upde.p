
TRIGGER PROCEDURE FOR WRITE OF Uzsakymas new buffer naujasUzsakymas old buffer senasUzsakymas.

  find Klientas where Klientas.KlientoKodas = naujasUzsakymas.KlientoKodas no-error.
  if error-status:error then do:
  message "Tokio kliento nera" view-as alert-box.
  undo.
  end.
  if AVAILABLE Klientas then do:
  Klientas.BendraUzsakymuSuma = Klientas.BendraUzsakymuSuma + naujasUzsakymas.Suma. - senasUzsakymas.Suma.
  Klientas.BendrasUzsakymuKiekis = Klientas.BendrasUzsakymuKiekis + 1.
  end.
  
  
