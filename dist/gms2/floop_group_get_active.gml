/// @shipit

/// @desc Get a list of all active keys that are currently being tweened

/// @arg id Floop group id

var list   = argument0[? ""],
	active = [],
	args;

for (var t = 0; t < ds_list_size(list); t ++) {
	args = list[| t];
	
	active[array_length_1d(active)] = args[1];
}

return active;