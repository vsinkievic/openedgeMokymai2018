TRIGGER PROCEDURE FOR ASSIGN of uzsakymas.suma.

FIND klientas where klientas.kodas = uzsakymas.kodas.
      if available klientas
        then assign 
		Klientas.UzsakymuKiekis = Klientas.UzsakymuKiekis + 1
		klientas.uzsakymuSuma = klientas.uzsakymuSuma + uzsakymas.suma.
