TRIGGER PROCEDURE FOR WRITE OF uzsakymas OLD BUFFER oldUzsakymas.


        find klientas where klientas.pavadinimas  = uzsakymas.pavadinimas.
        if uzsakymas.pavadinimas <> oldUzsakymas.pavadinimas 
            then do:
                klientas.bendras_uzsakymu_kiekis = klientas.bendras_uzsakymu_kiekis + 1.
                klientas.bendra_uzsakymu_suma = klientas.bendra_uzsakymu_suma - oldUzsakymas.suma + uzsakymas.suma.
            end.
        else klientas.bendra_uzsakymu_suma = klientas.bendra_uzsakymu_suma - oldUzsakymas.suma + uzsakymas.suma.
        
