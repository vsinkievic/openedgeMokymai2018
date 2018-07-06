// http://www.comptechdoc.org/independent/web/xml/guide/xmlexample.html

define temp-table tt_parts no-undo serialize-name "part"
       field f_item as character serialize-name "item" format "x(15)" label "item"
       field manufacturer as character format "x(15)"
       field model as character 
       field cost as decimal.
       
temp-table tt_parts:read-xml ("file","uzduotis7/computer_parts.xml","empty" ,?,?).

for each tt_parts no-lock: 
    display tt_parts.
end.    

temp-table tt_parts:write-json ("file","uzduotis7/write_to_json.json",yes).

// https://www.sitepoint.com/test-data-json-example/


define temp-table tt_people no-undo
       field id as integer 
       field first_name as character format "x(10)"
       field last_name as character 
       field email as character format "x(25)"
       field gender as character 
       field ip_address as character format "x(15)" .
       
temp-table tt_people:read-json ("file", "uzduotis7/json_example.json","empty").

for each tt_people no-lock:
    display tt_people with side-labels 1 col.
    display skip(1).
end.           

temp-table tt_people:write-xml ("file", "uzduotis7/json_to_xml.xml",yes).