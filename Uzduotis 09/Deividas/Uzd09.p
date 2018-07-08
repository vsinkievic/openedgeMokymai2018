//https://www.sitepoint.com/json-server-example*/
define temp-table clients no-undo
    field id as character  format "x(30)"
    field isActive as log 
    field age as integer  
    field Cname as character serialize-name "name" label "name" format "x(30)" 
    field gender as character 
    field company as character format "x(20)"
    field email as character format "x(50)"
    field phone as character format "x(25)"
    field address as character format "x(70)".
    
    //https://www.w3schools.com/xml/simple.xml 
define temp-table food no-undo 
    field Fname as character serialize-name "name" label "name" format "x(30)"
    field price as character
    field Fdescription as character serialize-name "description" label "description" format "x(70)"
    field calories as integer.
    
    
  //skaitomas XML
temp-table food:read-xml("file","C:\Users\Studentas1\Progress\Developer Studio 4.3.1\workspace\Uzduotys\9\xml_pavyzdys.xml", "empty",?,?).
    //XML i�vedamas i ekran�
    for each food no-lock:
        display food with stream-io width 300.
        display skip(2).
    end.
    //xml ra�oma i JSON
temp-table food:write-json("file", "C:\Users\Studentas1\Progress\Developer Studio 4.3.1\workspace\Uzduotys\9\\xml_i_json.json", yes).

  //skaitoma JSON i� pavyzd�io
temp-table clients:read-json("file","C:\Users\Studentas1\Progress\Developer Studio 4.3.1\workspace\Uzduotys\9\json_pavyzdys.json","empty").
    //JSON i�vedamas i ekrana
     for each clients no-lock:
        display clients with stream-io width 300.
        display skip(2).
    end.
    //JSON ra�omas � XML
temp-table clients:write-xml("file","C:\Users\Studentas1\Progress\Developer Studio 4.3.1\workspace\Uzduotys\9\json_i_xml.xml",yes).
    
    
 