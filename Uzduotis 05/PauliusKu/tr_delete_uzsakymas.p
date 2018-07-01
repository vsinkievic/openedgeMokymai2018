trigger procedure for delete of Uzsakymas.

find first klientas where klientas.kodas = uzsakymas.kodas no-error.
if available klientas 
then assign klientas.uzsakymu_kiekis = klientas.uzsakymu_kiekis - 1
           klientas.suma = klientas.suma - uzsakymas.kaina.