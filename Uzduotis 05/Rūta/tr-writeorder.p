TRIGGER PROCEDURE FOR WRITE OF Uzsakymas.

find Klientas where Klientas.Kodas = Uzsakymas.Kodas.
Klientas.UzKiekis = Klientas.UzKiekis + 1.
Klientas.UzSuma = Klientas.UzSuma + Uzsakymas.Suma.
