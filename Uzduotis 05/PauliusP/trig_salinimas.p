trigger procedure for delete of Uzsakymas.

FIND FIRST Klientas where Klientas.Kodas = Uzsakymas.Kodas no-error.
	if available Klientas 
		then assign 
		Klientas.UzsakymuKiekis = Klientas.UzsakymuKiekis - 1
		Klientas.UzsakymuSuma = Klientas.UzsakymuSuma - Uzsakymas.Suma.
