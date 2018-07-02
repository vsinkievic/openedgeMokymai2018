
define input-output parameter pcTekstas as character no-undo.
define output parameter pcRezultatas as character no-undo.
//define input parameter pcDarVienas as character no-undo.

//define  shared variable cBendras as character no-undo init "Bendras".

pcRezultatas = "World".

if false then return error "slaptas praneğimas".
pcTekstas = pcTekstas + "-".

 //   cBendras = cBendras + "-pakeistas per shared".

message "external_2" pcTekstas pcRezultatas.

message "Program-name:" program-name(2).