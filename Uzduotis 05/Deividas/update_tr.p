TRIGGER PROCEDURE FOR WRITE OF uzsakymas OLD BUFFER oldUzsakymas.


        find klientas where klientas.pavadinimas  = uzsakymas.pavadinimas.
        klientas.bendras_uzsakymu_kiekis = klientas.bendras_uzsakymu_kiekis + 1.
        klientas.bendra_uzsakymu_suma = klientas.bendra_uzsakymu_suma - oldUzsakymas.suma + uzsakymas.suma.
