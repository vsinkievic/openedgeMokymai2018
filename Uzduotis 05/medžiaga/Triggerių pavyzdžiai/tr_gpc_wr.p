trigger procedure for write of gps_card
   new buffer newRec old buffer oldRec.

function toLongToken character ( pcToken as char, pcMaskedPan as char ):
    def var cShortToken as char no-undo.
    case length(pcToken):
        when 9 then cShortToken = pcToken.
        when 16 then cShortToken = substr(pcToken, 4, 9).
        otherwise return "".
    end.        
    if length(pcMaskedPan) <> 16
    then return "".
    
    return "510" + cShortToken + substr(pcMaskedPan, 13, 4).

end function.

function toShortToken character (pcLongToken as char):
    
        if length(pcLongToken) = 16
        then return substr(pcLongToken, 4, 9).
        else return pcLongToken.
    
end function.

if newRec.tolken = "" and newRec.token > ""
then newRec.tolken = toLongToken(newRec.token, newRec.masked_pan).
else if newRec.token = "" and newRec.tolken > ""
then newRec.token = toShortToken(newRec.tolken).


def var isSame as log no-undo.
if newRec.crtd_on = ? then newRec.crtd_on = now.
if newRec.updt_on = ? then newRec.updt_on = now.
if newRec.crtd_by = "" then newRec.crtd_by = line.config.LineContext:CurrentCxt:EmpId.
if newRec.updt_by = "" then newRec.updt_by = line.config.LineContext:CurrentCxt:EmpId.
 
buffer-compare oldRec except ver
   to newRec save result in isSame.
   
if not isSame
then do:
    newRec.ver = oldRec.ver + 1.
    
    if oldRec.ver <> 0
    then do: 
        create gps_hiscard.
        assign 
          gps_hiscard.change_date = today
          gps_hiscard.pan = newRec.pan.
        buffer-copy oldRec to gps_hiscard.
    end.
end. 
