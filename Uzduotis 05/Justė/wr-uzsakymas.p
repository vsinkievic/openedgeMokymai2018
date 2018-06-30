trigger procedure for write of Uzsakymas new buffer naujasUzsakymas old buffer senasUzsakymas.

define var temp as decimal no-undo.

find Klientas where Klientas.Kodas = naujasUzsakymas.Kodas no-error.
if available Klientas then do:
    temp = naujasUzsakymas.suma - senasUzsakymas.suma.
    Klientas.UzsakymuSuma = Klientas.UzsakymuSuma + temp.
end.
