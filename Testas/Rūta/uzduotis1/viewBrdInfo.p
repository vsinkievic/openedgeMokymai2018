define variable months as character no-undo extent 12 initial ["Sausis", "Vasaris", "Kovas", "Balandis", "Gegužė", "Birželis", "Liepa", "Rugpjūtis", "Rugsėjis", "Spalis", "Lapkritis", "Gruodis"].
define variable daysOfTheWeek as character no-undo extent 7 initial ["Pirmadienis", "Antradienis", "Trečiadienis", "Ketvirtadienis", "Penktadienis", "Šeštadienis", "Sekmadienis"].
define variable birthDate as date no-undo format "9999-99-99".
define variable birthYear as integer no-undo format "9999".
define variable birthMonth as integer no-undo format "99".
define variable birthDay as integer no-undo format "99".
define variable livedDays as integer no-undo format "9999".
define variable birthDayOfTheWeek as integer no-undo.

update birthDate label "Gimimo data" help "Įveskite gimimo datą".
birthDay = day(birthDate).
birthMonth = month(birthDate).
birthYear = year(birthDate).
livedDays = (today - birthDate).
birthDayOfTheWeek = weekday(birthDate).
message birthYear months[birthMonth] birthDay view-as alert-box.
message "Pragyventų dienų skaičius:" livedDays view-as alert-box.
message "Savaitės diena:" daysOfTheWeek[birthDayOfTheWeek] view-as alert-box.
