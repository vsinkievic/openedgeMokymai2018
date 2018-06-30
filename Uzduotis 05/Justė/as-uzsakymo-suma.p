trigger procedure for assign of Uzsakymas.Suma.

find first Klientas where Klientas.Kodas = Uzsakymas.Kodas no-error.
if available Klientas 
then assign Klientas.UzsakymuSuma = Klientas.UzsakymuSuma + 1.
