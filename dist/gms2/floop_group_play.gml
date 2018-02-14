/// @desc Tweens a value in a floop group. If the value doesn't exist yet it just creates one.

/// @arg id       Floop group id
/// @arg key      Value key
/// @arg ease     Easing equation to use
/// @arg start    Starting value
/// @arg end      Ending value
/// @arg delay    Delay before executing
/// @arg duration Duration of ease
/// @arg loop?    OPTIONAL: Kind of loop to use (defaults to loops.none)
/// @arg opt1?    OPTIONAL: Extra argument 1 (For back eases, it's the overshoot) (For elastic eases, it's the amplitude)
/// @arg opt2?    OPTIONAL: Extra argument 2 (For elastic eases, it's the period)

if argument[1] == FLOOP_ALL {
	show_error("Tried to play an empty string or FLOOP_ALL", false);
	return;
}

var args = [],
	list = ds_map_find_value(argument[0], ""),
	t;

// Populate argument list with arguments (this is what goes into the list)
for (t = argument_count - 1; t > 0; t --) args[t] = argument[t];

args[0] = -args[5]; // Delay is handled with a negative time

// Handle optional arguments
switch argument_count {
	case 7:
		args[7] = loops.none;
		
	case 8:
		if argument[2] < eases.elastic_in args[8] = FLOOP_DEFAULT_BACK;
		else args[8] = argument[4] - argument[3];
		
	case 9:
		args[9] = argument[6] * FLOOP_DEFAULT_P_MULTIPLIER;
}

if !ds_map_exists(argument[0], argument[1]) then
	floop_group_set(argument[0], argument[1], argument[3]);

ds_list_add(list, args);

// Return the delay + duration for assisting in offsetting tweens correctly
return argument[5] + argument[6];