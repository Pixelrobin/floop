/// @shipit

/// @desc Check if a floop group exists at a given id

/// @arg id FLoop group id

if ds_exists(argument0, ds_type_map)
	then if ds_map_exists(argument0, FLOOP_ALL)
		then if ds_exists(argument0[? FLOOP_ALL], ds_type_list)
			then return true;

return false;