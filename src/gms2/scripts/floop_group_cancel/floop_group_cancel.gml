/// @desc Cancels a tween after adding it
/// floop_group_play_tween returns the id to use

/// @arg id    Floop group id
/// @arg key   Value key or FLOOP_ALL (returned by floop_group_play_tween)
/// @arg wait? OPTIONAL: Whether to wait for the currently playing tweens to finish before canceling (mostly useful for cancelling loops)

var wait = false,
	list   = ds_map_find_value(argument[0], ""),
	f, args;

// This will skip checking the keys against argument 1 in the list
skip = argument[1] == FLOOP_ALL;

if argument_count > 2 then wait = argument[2];

// Iterate through currently playing keys and cancel if needed
for (f = 0; f < ds_list_size(list); f ++) {
	args = list[| f];
	
	if skip || args[1] == argument[1] {
		if wait && args[0] > 0 then args[@ 7] = loops.none;
		else {		
			list[| f] = 0;
			ds_list_delete(list, f);
			f --;
		}
	}
}