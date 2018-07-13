define variable menesiai as character no-undo format "x(30)" extent 12
    init ["Sausio", "Vasario", "Kovo", "Balandþio", "Geguþës", 
          "Birþelio", "Liepos", "Rugpjûèio", "Rugsëjo", "Spalio",
          "Lapkrièio", "Gruodþio"].
define variable savaites_dienos as character no-undo format "x(13)" extent 7
    init ["Pirmadienis", "Antradienis", "Treèiadienis", "Ketvirtadienis",
    "Penktadienis", "Ðeðtadienis", "Sekmadienis"].
    
define variable gimimo_metai as integer no-undo.
define variable gimimo_menuo as integer no-undo.
define variable gimimo_diena as integer no-undo.
define variable savaites_diena as integer no-undo.
define variable siandiena as date no-undo.
define variable egzistavimo_dienos as integer no-undo.
define variable gimimo_data as date no-undo.
define variable dienos_numeris as integer.

siandiena = date(today).
display siandiena.

define frame gimtadienis
    skip (1)
    gimimo_metai
    gimimo_menuo
    gimimo_diena
    with 1 col centered.
    
display "Áveskite savo gimimo datà".
update gimimo_metai gimimo_menuo gimimo_diena. //with frame gimtadienis.
if gimimo_menuo > 12
    then do:
        display "Yra tik 12 mënesiø, áveskite ið naujo.".
        update gimimo_menuo.
    end.
if gimimo_menuo > 31
    then do:
        display "Yra tik 31 diena, áveskite ið naujo.".
        update gimimo_diena.
    end.
    
gimimo_data = date (gimimo_menuo, gimimo_diena, gimimo_metai).
egzistavimo_dienos = interval(siandiena, gimimo_data, "days").
dienos_numeris = weekday (gimimo_data).

message substitute ("Þmogus gimë &1 metais, &2 mënesá, &3 dienà.", gimimo_metai, menesiai[gimimo_menuo], gimimo_diena) view-as alert-box.
message substitute ("Jis jau pragyveno &1 dienas", egzistavimo_dienos).
message substitute ("Jis gimë &1", savaites_dienos[dienos_numeris]).