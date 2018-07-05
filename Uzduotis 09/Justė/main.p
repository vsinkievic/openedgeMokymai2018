/*XML example: http://www.beerxml.com/water.xml*/
define temp-table tt_water no-undo serialize-name "water"
    field fName as character serialize-name "name" format "x(20)" label "name"
    field fVersion as int serialize-name "version" label "version"
    field amount as decimal
    field calcium as decimal 
    field bicarbonate as decimal
    field sulfate as decimal
    field chloride as decimal
    field sodium as decimal
    field magnesium as decimal
    field ph as decimal
    field notes as character format "x(100)"
    field display_amount as character
    field id as recid xml-node-type "hidden".
    
define dataset ds_waters serialize-name "waters" for tt_water.

/*JSON example: https://www.sitepoint.com/json-server-example*/
define temp-table clients no-undo 
    field id as character format "x(25)"
    field isActive as log
    field age as integer format ">>>"
    field f_name as character serialize-name "name" label "name" format "x(20)"
    field gender as character
    field company as character format "x(10)"
    field email as character format "x(30)"
    field phone as character format "x(20)"
    field address as character format "x(65)".

/*---------------------READING/WRITING---------------------*/
dataset ds_waters:read-xml("file","xml_example.xml","empty",?,?).
for each tt_water no-lock:
    display tt_water with stream-io width 250.
    display skip(2).
end.
dataset ds_waters:write-json("file","xml_to_json.json",yes).

temp-table clients:read-json("file","json_example.json","empty").
for each clients no-lock:
    display clients with stream-io width 200.
    display skip(2).
end.
temp-table clients:write-xml("file","json_to_xml.xml",yes).