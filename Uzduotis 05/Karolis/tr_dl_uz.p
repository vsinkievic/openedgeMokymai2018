TRIGGER PROCEDURE FOR DELETE OF Uzsakymas.


find Klientas where Klientas.KlientoKodas = Uzsakymas.KlientoKodas no-error.
if error-status:error then do:
  message "Tokio kliento nera" view-as alert-box.
  undo.
  end.
if AVAILABLE Klientas then assign
Klientas.BendrasUzsakymuKiekis = Klientas.BendrasUzsakymuKiekis - 1
Klientas.BendraUzsakymuSuma = Klientas.BendraUzsakymuSuma - Uzsakymas.Suma.
