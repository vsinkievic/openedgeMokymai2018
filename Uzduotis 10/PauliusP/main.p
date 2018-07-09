
/*------------------------------------------------------------------------
    File        : main.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : 
    Created     : Mon Jul 09 17:16:44 EEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

USING skaiciavimas.*.
USING new_skaiciavimas.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

define variable pasirinkimas as integer label "Pasirinkimas" no-undo.
define variable pirmas as decimal label "Pirmas skai�ius" no-undo.
define variable antras as decimal label "Antras skai�ius" no-undo.
define variable trecias as decimal label "Tre�ias skai�ius" no-undo.
define variable rezultatai as class skaiciavimas no-undo.
define variable new_rezultatai as class new_skaiciavimas no-undo.

//Duomen� �vedimas.
display "�veskite lygt�" Skip(1).
update pirmas antras trecias.

//Programos pasirinkimas
display "Pasirinkite kuriuo b�du norite �vykdyti program�".
display "1 - pirmasis variantas (naudojant konstruktori�), 2 - antrasis variantas (metodas)" Skip(1).
update pasirinkimas.

if pasirinkimas = 1     //Pirmas b�das. Failai: kaiciavimas.cls ir test.p
    then do:    
    //Vykdomas skai�iavimas.
    rezultatai = new skaiciavimas(pirmas, antras, trecias).
    //display rezultatai:x1 label "x1" rezultatai:x2 label "x2" with 1 col centered.

    //Tikriname rezultatus ir informuojame apie galimas klaidas.
    if rezultatai:ar_yra
        then do:
            if rezultatai:x2 = ?
                then do:
                    message "Diskriminanto reik�m� yra lygi nuliui, tod�l lygtis turi tik vien� sprendin�:" rezultatai:x1 view-as alert-box.
                end.
                else do:
                    message "Lygtis turi du sprendinius:" rezultatai:x1 "ir" rezultatai:x2 view-as alert-box.
                end.
            end.
        else do:
            message "Klaida! Diskriminantas negali b�ti neigiamas, tod�l lygtis neturi sprendini�." view-as alert-box.
        end.
  end.

else if pasirinkimas = 2     //Kitas b�das. Failai: new_skaiciavimas.cls ir new_test.p
    then do:
    //Vykdomas skai�iavimas.
    new_rezultatai = new new_skaiciavimas().
    //display new_rezultatai:x1 label "x1" new_rezultatai:x2 label "x2" with 1 col centered.

    //Tikriname rezultatus ir informuojame apie galimas klaidas.
    if new_rezultatai:ar_yra(pirmas, antras, trecias)
        then do:
            if  new_rezultatai:x2 = ?
                then do:
                    message "Diskriminanto reik�m� yra lygi nuliui, tod�l lygtis turi tik vien� sprendin�:" new_rezultatai:x1 view-as alert-box.
                end.
                else do:
                    message "Lygtis turi du sprendinius:" new_rezultatai:x1 "ir" new_rezultatai:x2 view-as alert-box.
                end.
            end.
        else do:
            message "Klaida! Diskriminantas negali b�ti neigiamas, tod�l lygtis neturi sprendini�." view-as alert-box.
        end.
    end.
else message "Tokio pasirinkimo n�ra" view-as  alert-box.