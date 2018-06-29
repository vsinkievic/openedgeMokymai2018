trigger procedure for create of doc_event.

assign doc_event.dce_id        = next-value(dce_id)
       doc_event.crtd_wrn_id = line.config.LineContext:CurrentCxt:WrnId
       doc_event.crtd_on = now
       doc_event.crtd_by = line.config.LineContext:CurrentCxt:EmpId
       .

