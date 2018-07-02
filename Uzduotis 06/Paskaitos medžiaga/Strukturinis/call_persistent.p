
define variable my_persistent_proc as handle no-undo.

message "iki pers run" string(my_persistent_proc).
run Strukturinis/persistent_proc.p persistent set my_persistent_proc.

message "po pers run" string(my_persistent_proc).

run display_customers in my_persistent_proc.
run display_customers in my_persistent_proc.
run display_customers in my_persistent_proc.
