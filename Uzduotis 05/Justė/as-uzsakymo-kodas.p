trigger procedure for assign of Uzsakymas.Kodas.

find first Klientas where Klientas.Kodas = Uzsakymas.Kodas no-error.
if available Klientas 
then assign Klientas.UzsakymuKiekis = Klientas.UzsakymuKiekis + 1.
