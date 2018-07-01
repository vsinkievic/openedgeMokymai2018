TRIGGER PROCEDURE FOR DELETE OF uzsakymas.

FIND klientas where klientas.pavadinimas = uzsakymas.pavadinimas no-error.
	if available Klientas 
		then assign 
		klientas.bendras_uzsakymu_kiekis = klientas.bendras_uzsakymu_kiekis - 1
		klientas.bendra_uzsakymu_suma = klientas.bendra_uzsakymu_suma - uzsakymas.Suma.
