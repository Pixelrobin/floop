/// @shipit

/// @desc Update a floop group and it's values according to list set

/// @arg id     Floop group id
/// @arg delta? OPTIONAL: Amount of time to progress (Must be positive)

/*
	Array arguments for reference:
	args[0] = time
	args[1] = key
	args[2] = ease
	args[3] = start
	args[4] = end
	args[5] = delay
	args[6] = duration
	args[7] = loop mode
	args[8] = additional 1
	args[9] = additional 2
*/

var delta = 1;

if argument_count > 1 {
	if argument[1] < 0
		then show_debug_message("floop_group_update delta must be positive.");
		else if argument[1] == 0 then return;
			else delta = argument[1];
}

var args, finish,
	tween = 0,
	list = ds_map_find_value(argument[0], FLOOP_ALL),
	active = [];

for (tween = 0; tween < ds_list_size(list); tween ++) {
	args = list[|tween];
	
	if args[0] <= args[6] {
		
		// Tween the appropriate value
		// Negative time is used for delay
		
		if args[0] >= 0 {
			ds_map_set(argument[0], args[1],
				floop_tween(
					args[2], args[3], args[4],
					args[0], args[6], args[8],
					args[9]
				)
			);
		}
		
		args[@ 0] += delta;
	} else {
		
		// Once done, Handle loops
		
		switch args[7] {
			default:
			case loops.none:
				ds_list_delete(list, tween);
				tween --;
			break;
			
			case loops.replay: args[@ 0] = -args[5]; break;
		
			case loops.patrol:
				var tmp;
			
				args[@ 0] = -args[5];
			
				tmp = args[3];
				args[@ 3] = args[4];
				args[@ 4] = tmp;
			break;
		}
	}
}