

define variable cTekstas as character no-undo init "Hello".
define variable cKitas as character no-undo.

define variable cBendras as character no-undo init "Bendras".

message "A" cTekstas cKitas cBendras.

//run internal_1 (input-output cTekstas, output cKitas) no-error. 
run external_2 (input-output cTekstas, output cKitas) /* no-error*/. 
/*if error-status:error                             */
/*then message return-value view-as alert-box error.*/

message "B" cTekstas cKitas cBendras.

message "Return value" return-value.



// INTERNAL PROCEDURES

procedure internal_1:
    define input-output parameter pcTekstas as character no-undo.
    define output parameter pcRezultatas as character no-undo.
    //define input parameter pcDarVienas as character no-undo.
    
    define variable cVidinis as character no-undo init "vidinis".
    
    cVidinis =cVidinis + "B".
    pcRezultatas = "World".
    
    if false then return error "slaptas praneðimas".
    pcTekstas = pcTekstas + "-".
    
    cBendras = cBendras + "-pakeistas".
    
    message "internal_1" pcTekstas pcRezultatas.

end procedure.



/*procedure external_2:                                            */
/*    define input-output parameter pcTekstas as character no-undo.*/
/*    define output parameter pcRezultatas as character no-undo.   */
/*    //define input parameter pcDarVienas as character no-undo.   */
/*                                                                 */
/*    pcRezultatas = "World".                                      */
/*                                                                 */
/*    if false then return error "slaptas praneðimas".             */
/*    pcTekstas = pcTekstas + "-".                                 */
/*                                                                 */
/*    message "external_2-vidinë" pcTekstas pcRezultatas.          */
/*                                                                 */
/*end procedure.                                                   */