
/*------------------------------------------------------------------------
    File        : main.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : PauliusKu
    Created     : Sat Jul 07 13:21:34 EEST 2018
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.


DEFINE TEMP-TABLE catalog NO-UNDO XML-NODE-NAME "CD" LABEL "Catalog"
    FIELD cd-title AS CHARACTER FORMAT "x(30)" SERIALIZE-NAME "TITLE" LABEL "Title"
    FIELD artist AS CHARACTER FORMAT "x(30)" SERIALIZE-NAME "ARTIST" LABEL "Artist"
    FIELD country AS CHARACTER FORMAT "x(30)" SERIALIZE-NAME "COUNTRY" LABEL "Country"
    FIELD company AS CHARACTER FORMAT "x(30)" SERIALIZE-NAME "COMPANY" LABEL "Company"
    FIELD price AS DECIMAL DECIMALS 2 SERIALIZE-NAME "PRICE" LABEL "Price"
    FIELD cd-year AS INTEGER SERIALIZE-NAME "YEAR" LABEL "Year".
    

    


/* ***************************  Main Block  *************************** */
//Source: https://www.w3schools.com/xml/cd_catalog.xml
//Reads from xml then writes to json then reads from same json and finaly writes to xml.
//The output xml should be similar to the input xml file.
TEMP-TABLE catalog:READ-XML("file","C:\Users\Studentas1\Progress\Developer Studio 4.3.1\workspace\9uzduotis\input.xml","empty",?,?).
TEMP-TABLE catalog:WRITE-JSON ("file","C:\Users\Studentas1\Progress\Developer Studio 4.3.1\workspace\9uzduotis\inner.json", YES).
TEMP-TABLE catalog:READ-JSON("file","C:\Users\Studentas1\Progress\Developer Studio 4.3.1\workspace\9uzduotis\inner.json","empty").
TEMP-TABLE catalog:WRITE-XML("file", "C:\Users\Studentas1\Progress\Developer Studio 4.3.1\workspace\9uzduotis\output.xml", YES, "utf-8", ?, NO).

FOR EACH catalog NO-LOCK :
    DISPLAY catalog WITH WIDTH 160.
END.
