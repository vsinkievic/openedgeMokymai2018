define variable temp as integer no-undo.

update temp label "Kliento kodas." help "Įveskite kliento, kurį norite ištrinti, kodą.".
find first klientas exclusive-lock where klientas.kodas = temp no-error.
if available klientas then do transaction: 
    find first uzsakymas where uzsakymas.kodas = klientas.kodas no-error.
    if available uzsakymas then do:
        message "Šio kliento ištrinti negalima, nes jis turi užsakymų" view-as alert-box.
    end.
    else do:
        delete klientas.
        message "Klientas " temp " ištrintas" view-as alert-box.
    end.    
end.
else do:
    message "Toks klientas neegzistuoja!" view-as alert-box.
end.