/// @shipit

/// @desc Get a value from a floop_group

/// @arg id       Floop group id
/// @arg key      Value key
/// @arg default? OPTIONAL: Default value to substitute if key doesn't exist

if argument[1] == FLOOP_ALL {
	show_error("Tried to get an empty string or FLOOP_ALL", false);
	return;
}

if argument_count > 2 {
	if ds_map_exists(argument[0], argument[1])
		then return ds_map_find_value(argument[0], argument[1])
		else return argument[2];
} else return ds_map_find_value(argument[0], argument[1]);