
define variable arVesiteDar as log no-undo init true.

                                                          
do while arVesiteDar <> false:
        do transaction:
            create Klientas.
            update Klientas.KlientoVardas label "�veskite kliento vard�" format "x(25)".     
        end.
        update arVesiteDar label "Ar dar vesite klient�?".
end.
 
      