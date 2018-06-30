output to "ataskaita.txt".

for each Klientas no-lock by UzsakymuSuma descending:
    display Klientas with stream-io width 400.
    for each Uzsakymas where Uzsakymas.Kodas = Klientas.Kodas:
        display Uzsakymas with stream-io width 400.
    end.
end.

output close.