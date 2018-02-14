/// @desc Set a value in a floop_group

/// @arg id    Floop group id
/// @arg key   Value key or FLOOP_ALL
/// @arg value Value to set

if argument[1] == FLOOP_ALL {
	
	// Setting all the keys in a ds_map has the potential to be slow, so use wisely!
	
	var key = ds_map_find_first(argument[0]);
	
	repeat (ds_map_size(argument[0])) {
		ds_map_replace(argument[0], key, argument[2]);
		key = ds_map_find_next(argument[0], key);
	}
} else argument0[? argument1] = argument2;