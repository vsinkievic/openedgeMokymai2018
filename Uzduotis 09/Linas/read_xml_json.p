
// XML nuskaitymas ið https://tv.15min.lt/data/xml/Cgates_epg/xmltv.xml
// (vienos dienos TV programa)
// panaudotas metodas "load"


define variable hDoc as handle no-undo.
define variable hRoot as handle no-undo.
define variable hChannel as handle.
define variable hEvent as handle.
define variable hTitle as handle.
define variable hDescription as handle.
define variable hText as handle.
define variable ix as integer no-undo init 1.
define variable iy as integer no-undo.
define stream sChannels.

create x-document hDoc.
create x-noderef hRoot.
create x-noderef hChannel.
create x-noderef hEvent.
create x-noderef hTitle.
create x-noderef hDescription.
create x-noderef hText.

hDoc:load("file", "xmltv_sample.xml", false).
hDoc:get-document-element(hRoot).

define temp-table ttChannel no-undo
    field id as integer 
    field cName as character.
    
define temp-table ttEvent no-undo
    field id as character
    field channel_id as integer
    field start_time as datetime
    field duration as character
    field original_title as character 
    field long_description as character.

define dataset dsListing for ttChannel, ttEvent
    data-relation rel1 for ttChannel, ttEvent relation-fields(id, channel_id) nested.

repeat ix = 1 to 20:   //tik pirmus kelis kanalus, nes labai daug info
    hRoot:get-child(hChannel, ix).
    if hChannel:get-attribute("name") <> "" then do:
        create ttChannel.
        ttChannel.id = (ix + 1) / 2.
        ttChannel.cName = hChannel:get-attribute("name").
            repeat iy = 1 to hChannel:num-children:
                hChannel:get-child(hEvent, iy).
                if hEvent:get-attribute("id") <> "" then do:
                    create ttEvent.
                    ttEvent.id = hEvent:get-attribute("id").
                    ttEvent.channel_id = ttChannel.id.
                    ttEvent.start_time = datetime(hEvent:get-attribute("start_time")).
                    ttEvent.start_time = ttEvent.start_time + 2 * 60 * 60 * 1000. //GMT -> vietos laikas
                    ttEvent.duration = hEvent:get-attribute("duration").
                    hEvent:get-child(hTitle, 2).
                    ttEvent.original_title = hTitle:get-attribute("value").
                    hEvent:get-child(hDescription, 4).
                    if hDescription:num-children > 0 then do:
                        hDescription:get-child(hText, 1).
                        ttEvent.long_description = hText:node-value.
                    end.
                    else ttEvent.long_description = "".
                end.
            end.
     end.            
end.

// kanalo pasirinkimas, kurá iðvesti á txt:

define query qChannels for ttChannel.
define browse bSelect query qChannels no-lock
    display ttChannel.cName format "x(140)" with 20 down.
define frame fSelect space (3) bSelect skip(1) space (3)
    with width 300 title "Choose channel to display" centered.
    
on default-action of browse bSelect do:
    hide all.
    for each ttEvent where ttEvent.channel_id = ttChannel.id:
        display stream sChannels start_time format "99-99-99 hh:mm" label "Time"
            original_title format "x(50)" label "Title"
            string((integer(duration) / 60)) label "Duration" "min"
            skip with stream-io.
    end.
    message "Selected channel" ttChannel.cName 
        " displayed at channel_listings.txt" skip
        "Listings JSON format saved to channel_listings.json".
        
// visø kanalø iðvedimas á json:
    dataset dsListing:write-json("file", "channel_listings.json", true).
    quit.
end.

output stream sChannels to 'channel_listings.txt'.

open query qChannels for each ttChannel.
enable all with frame fSelect.
apply "value-changed" to browse bSelect.
wait-for window-close of current-window.

output close.



//JSON nuskaitymas ið pavyzdëlio, rasto internete:


define temp-table ttContacts no-undo
  field id as integer
  field first_name as character
  field last_name as character
  field email as character
  field gender as character
  field ip_address as character.

temp-table ttContacts:read-json("file", "sample.json", "empty").

for each ttContacts:
    display ttContacts.
end.


