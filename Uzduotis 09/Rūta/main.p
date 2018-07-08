/*https://www.sitepoint.com/colors-json-example*/
/*https://www.w3schools.com/xml/cd_catalog.xml */

define temp-table cd no-undo serialize-name "cd"
    field cdTitle   as character serialize-name "title"   format "x(30)" label "title"
    field cdArtist  as character serialize-name "artist"  format "x(30)" label "artist"
    field cdCountry as character serialize-name "country" format "x(30)" label "country"
    field cdCompany as character serialize-name "company" format "x(30)" label "company"
    field cdPrice   as decimal   serialize-name "price"   label "price"
    field cdYear    as integer   serialize-name "year"    label "year".
    
define temp-table clients no-undo serialize-name "clients"
    field id         as character format "x(30)"
    field isActive   as log 
    field age        as integer  
    field clientName as character serialize-name "name" label "name" format "x(30)" 
    field gender     as character 
    field company    as character format "x(30)"
    field email      as character format "x(50)"
    field phone      as character format "x(30)"
    field address    as character format "x(50)".
    
temp-table cd:read-xml("file", "cd_catalog.xml", "empty", ?, ?).
for each cd no-lock:
    display cd with stream-io width 300.
    display skip(2).
end.
temp-table cd:write-json("file", "xml_json.json", yes).
temp-table clients:read-json("file", "server.json", "empty").
for each clients no-lock:
    display clients with stream-io width 300.
    display skip(2).
end.
temp-table clients:write-xml("file", "json_xml.xml", yes).