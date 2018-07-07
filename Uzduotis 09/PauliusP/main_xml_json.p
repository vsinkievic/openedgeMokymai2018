
/*------------------------------------------------------------------------
    File        : main_xml_json.p
    Description : Darbas su XML ir JSON failais, - jø rodymas ir keitimas.
    Author(s)   : PauliusP
    Created     : Sat Jul 07 10:21:10 EEST 2018
    Notes       : xml failas: https://www.w3schools.com/xml/plant_catalog.xml
                  json failas: https://www.sitepoint.com/colors-json-example/
  ----------------------------------------------------------------------*/

define temp-table plant no-undo serialize-name "plant"
    field common as character format "x(30)"
    field botanical as character format "x(30)"
    field zone as character 
    field light as character format "x(15)"
    field price as character 
    field availability as integer.
    
define temp-table spalvos no-undo serialize-name "colors"
    field aliceblue as character
    field antiquewhite as character
    field aqua as character
    field aquamarine as character
    field azure as character
    field beige as character
    field bisque as character
    field black as character
    field blanchedalmond as character
    field blue as character
    field blueviolet as character
    field brown as character.

//XML rodymas ir keitimas ið XML á JSON
temp-table plant:read-xml("file","C:/mokymai/db/uzd9/plant_catalog.xml","empty",?,?).
temp-table plant:write-json ("file","C:/mokymai/db/uzd9/xml-json.json", yes).

for each plant no-lock :
    display plant with width 140.
end.

//JSON rodymas ir keitimas ið JSON á XML
temp-table spalvos:read-json("file","C:/mokymai/db/uzd9/colors_example.json","empty").
temp-table spalvos:write-xml ("file","C:/mokymai/db/uzd9/json-xml.xml", yes).

for each spalvos no-lock:
    display "Spalvos ir jø kodai" with centered.
    display spalvos with 1 col.
end.