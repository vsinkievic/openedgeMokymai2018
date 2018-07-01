trigger procedure for write of uzsakymas new buffer newUzsakymas old buffer oldUzsakymas.

define var temp as decimal no-undo.

find klientas where klientas.kodas = newUzsakymas.kodas no-error.
if available klientas then do:
    temp = newUzsakymas.kaina - oldUzsakymas.kaina.
    klientas.suma = klientas.suma + temp.
end.