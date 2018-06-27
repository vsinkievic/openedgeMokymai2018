define variable menesiai as character no-undo format "x(25)" 
  init "Sausis;;asaris;Kovas;Balandis;Geguþë;Birþelis;Liepa;Rugpjûtis;Rugsëjis;Spalis;Lapkritis;Gruodis".

define variable i as integer no-undo.
          

repeat i = 1 to num-entries(menesiai, ";"): 
    display i (minimum maximum average total)  .
   
    if i = 6
    then entry(i, menesiai, ";") = "June".
   
    display entry(i, menesiai, ";").
end.
message menesiai view-as alert-box.

/*output to "menesiai.csv" convert target "utf-8".                        */
/*repeat i = 1 to extent(menesiai):                                       */
/*    export delimiter "~t" i menesiai[i].                                */
/*end.                                                                    */
/*output close.                                                           */
/*                                                                        */
/*output to "menesiai1.txt".                                              */
/*repeat i = 1 to extent(menesiai):                                       */
/*   put unformatted substitute ("Mënuo &1 yra &2."; i; menesiai[i]) skip.*/
/*end.                                                                    */
/*output close.                                                           */