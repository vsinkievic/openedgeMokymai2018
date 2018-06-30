TRIGGER PROCEDURE FOR DELETE OF Uzsakymas.

find Klientas where Klientas.Kodas = Uzsakymas.Kodas no-error.
assign Klientas.UzKiekis = Klientas.UzKiekis - 1 Klientas.UzSuma = Klientas.UzSuma - Uzsakymas.Suma.
