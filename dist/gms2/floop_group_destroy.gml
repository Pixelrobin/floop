/// @shipit

/// @desc Destroy a floop group

/// @arg id Floop group id

ds_list_destroy(ds_map_find_value(argument0, FLOOP_ALL));
ds_map_destroy(argument0);