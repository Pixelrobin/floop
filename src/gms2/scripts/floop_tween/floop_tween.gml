/// @shipit

/// @desc Tween a value using one of select equations

/// @arg ease     Easing equation to use
/// @arg start    Starting value
/// @arg end      Ending value
/// @arg time     Current time
/// @arg duration Duration of ease
/// @arg opt1?    OPTIONAL: Extra argument (For back eases, it's the overshoot) (For elastic eases, it's the amplitude)
/// @arg opt2?    OPTIONAL: Extra argument (For elastic eases, it's the period)

// Mostly optimized for speed over code prettiness
// At one point, I wanted to move these to a dll, but that would be overkill (?)

/*
	Sources for reference:
	http://robertpenner.com/easing/
	http://easings.net/
	https://github.com/EmmanuelOga/easing
	https://github.com/jesusgollonet/processing-penner-easing
*/

var change = argument[2] - argument[1];

switch argument[0] {
	// MISC
	case eases.sudden:
		return argument[3] >= argument[4] ? argument[2] : argument[1];
	
	default:
		show_debug_message("Tween with id: " + string(argument[0]) + " does not exist. Defaulting to linear.");
	case eases.linear:
		return change * argument[3] / argument[4] + argument[1];
	
	
	// SINE
	case eases.sine_in:
		return -change * cos(argument[3] / argument[4] * (pi / 2)) + change + argument[1];
	
	case eases.sine_out:
		return change * sin(argument[3] / argument[4] * (pi / 2)) + argument[1];
	
	case eases.sine_inout:
		return -change / 2 * (cos(pi * argument[3] / argument[4]) - 1) + argument[1];
	
	
	// QUADRATIC
	case eases.quad_in:
		argument[3] /= argument[4];
		return change * argument[3] * argument[3] + argument[1];
		
	case eases.quad_out:
		argument[3] /= argument[4];
		return -change * argument[3] * (argument[3] - 2) + argument[1];
		
	case eases.quad_inout:
		argument[3] /= argument[4] / 2;
		if (argument[3] < 1) return change / 2 * argument[3] * argument[3] + argument[1];
		argument[3] --;
		return -change / 2 * (argument[3] * (argument[3] - 2) - 1) + argument[1];
	
	
	// CUBIC
	case eases.cube_in:
		argument[3] /= argument[4];
		return change * argument[3] * argument[3] * argument[3] + argument[1];
	
	case eases.cube_out:
		argument[3] = argument[3] / argument[4] - 1;
		return change * (argument[3] * argument[3] * argument[3] + 1) + argument[1];
		
	case eases.cube_inout:
		argument[3] /= argument[4] / 2;
		if (argument[3] < 1) return change / 2 * argument[3] * argument[3] * argument[3] + argument[1];
		argument[3] -= 2;
		return change / 2 * (argument[3] * argument[3] * argument[3] + 2) + argument[1];
	
	
	// QUARTIC
	case eases.quart_in:
		argument[3] /= argument[4];
		return change * argument[3] * argument[3] * argument[3] * argument[3] + argument[1];
	
	case eases.quart_out:
		argument[3] = argument[3] / argument[4] - 1;
		return -change * (argument[3] * argument[3] * argument[3] * argument[3] - 1) + argument[1];
	
	case eases.quart_inout:
		argument[3] /= argument[4] / 2;
		if (argument[3] < 1) return change / 2 * argument[3] * argument[3] * argument[3] * argument[3] + argument[1];
		argument[3] -= 2;
		return -change / 2 * (argument[3] * argument[3] * argument[3] * argument[3] - 2) + argument[1];
	
	
	// QUINTIC
	case eases.quint_in:
		argument[3] /= argument[4];
		return change * argument[3] * argument[3] * argument[3] * argument[3] * argument[3] + argument[1];
		
	case eases.quint_out:
		argument[3] = argument[3] / argument[4] - 1;
		return change * (argument[3] * argument[3] * argument[3] * argument[3] * argument[3] + 1) + argument[1];
	
	case eases.quint_inout:
		argument[3] /= argument[4] / 2;
		if (argument[3] < 1) return change / 2 * argument[3] * argument[3] * argument[3] * argument[3] * argument[3] + argument[1];
		argument[3] -= 2;
		return change / 2 * (argument[3] * argument[3] * argument[3] * argument[3] * argument[3] + 2) + argument[1];
	
	
	// EXPONENTIAL
	case eases.expo_in:
		return change * power(2, 10 * (argument[3] / argument[4] - 1)) + argument[1];
		
	case eases.expo_out:
		return change * (-power(2, -10 * argument[3] / argument[4]) + 1) + argument[1];
		
	case eases.expo_inout:
		argument[3] /= argument[4] / 2;
		if (argument[3] < 1) return change / 2 * power(2, 10 * (argument[3] - 1)) + argument[1];
		argument[3] --;
		return change / 2 * (-power(2, -10 * argument[3]) + 2) + argument[1];

	// CIRCLE
	case eases.circ_in:
		argument[3] /= argument[4];
		return -change * (sqrt(1 - argument[3] * argument[3]) - 1) + argument[1];
	
	case eases.circ_out:
		argument[3] = argument[3] / argument[4] - 1;
		return change * sqrt(1 - argument[3] * argument[3]) + argument[1];
		
	case eases.circ_inout:
		argument[3] /= argument[4] / 2;
		if argument[3] < 1 return -change / 2 * ((1 - argument[3] * argument[3]) - 1) + argument[1];
		argument[3] -= 2;
		return change / 2 * (sqrt(1 - argument[3] * argument[3]) + 1) + argument[1];
		//if argument[3] < 1 return -change / 2 * ((1 - argument[3] * argument[3]) - 1) + argument[1];
	
	
	// BACK (argument5 = overshoot)
	case eases.back_in:
		var s;
		
		if argument_count < 6 then s = FLOOP_DEFAULT_BACK;
		else s = argument[5];
		
		argument[3] /= argument[4];
		return change * argument[3] * argument[3] * ((s + 1) * argument[3] - s) + argument[1];
	
	case eases.back_out:
		var s;
		
		if argument_count < 6 then s = FLOOP_DEFAULT_BACK;
		else s = argument[5];
		
		argument[3] = argument[3] / argument[4] - 1;
		return change * (argument[3] * argument[3] * ((s + 1) * argument[3] + s) + 1) + argument[1];
		
	case eases.back_inout:
		var s;
		
		if argument_count < 6 then s = FLOOP_DEFAULT_BACK;
		else s = argument[5];
		
		s *= 1.525;
		argument[3] /= argument[4] / 2;
		
		if argument[3] < 1 return change / 2 * (argument[3] * argument[3] * ((s + 1) * argument[3] - s)) + argument[1];
		
		argument[3] -= 2;
		return change / 2 * (argument[3] * argument[3] * ((s + 1) * argument[3] + s) + 2) + argument[1];
	
	// ELASTIC (argument5 = amplitude, argument6 = period)
	case eases.elastic_in:
		var s, a, p;
		
		if argument[3] <= 0 return argument[1];
		argument[3] /= argument[4];
		if argument[3] >= 1 return argument[1] + change;
		
		if argument_count < 7 then p = argument[4] * FLOOP_DEFAULT_P_MULTIPLIER;
		else p = argument[6];
		
		// It's done this way because of how GMS handles AND statements :\
		// Basically, GMS likes to evaluate all the statements in order, even if one already returned false
		// So this doesn't play well with arguments that don't exist
		if argument_count < 6 {a = change; s = p / 4;}
		else {
			a = argument[5];
			
			if a < abs(change) {a = change; s = p / 4;}
			else s = p / (2 * pi) * arcsin(change / a);
		}
		
		argument[3] --;
		return -(a * power(2, 10 * argument[3]) * sin((argument[3] * argument[4] - s) * (2 * pi) / p)) + argument[1];
		
	case eases.elastic_out:
		var s, a, p;
		
		if argument[3] <= 0 return argument[1];
		argument[3] /= argument[4];
		if argument[3] >= 1 return argument[1] + change;
		
		if argument_count < 7 then p = argument[4] * FLOOP_DEFAULT_P_MULTIPLIER;
		else p = argument[6];
		
		// See comment on elastic_in
		if argument_count < 6 {a = change; s = p / 4;}
		else {
			a = argument[5];
			
			if a < abs(change) {a = change; s = p / 4;}
			else s = p / (2 * pi) * arcsin(change / a);
		}
		
		return a * power(2, -10 * argument[3]) * sin((argument[3] * argument[4] - s) * (2 * pi) / p) + change + argument[1];
		
	
	case eases.elastic_inout:
		var s, a, p;
		
		if argument[3] <= 0 return argument[1];
		argument[3] = argument[3] / argument[4] * 2;
		if argument[3] >= 2 return argument[1] + change;
		
		if argument_count < 7 then p = argument[4] * FLOOP_DEFAULT_P_MULTIPLIER;
		else p = argument[6];
		
		// See comment on elastic_in
		if argument_count < 6 {a = change; s = p / 4;}
		else {
			a = argument[5];
			
			if a < abs(change) {a = change; s = p / 4;}
			else s = p / (2 * pi) * arcsin(change / a);
		}
		
		if argument[3] < 1 {
			argument[3] --;
			return -0.5 * (a * power(2, 10 * argument[3]) * sin((argument[3] * argument[4] - s) * (2 * pi) / p)) + argument[1];
		} else {
			argument[3] --;
			return a * power(2, -10 * argument[3]) * sin((argument[3] * argument[4] - s) * (2 * pi) / p) * 0.5 + change + argument[1];
		}
	
	// BOUNCE
	case eases.bounce_in:
		return change - floop_tween(eases.bounce_out, 0, change, argument[4] - argument[3], argument[4]) + argument[1];
	
	case eases.bounce_out:
		argument[3] /= argument[4];
		
		if argument[3] < 0.36363636363636365 { // aka 1 / 2.75
			return change * (7.5625 * argument[3] * argument[3]) + argument[1];
		
		} else if argument[3] < 0.7272727272727273 { // aka 2 / 2.75
			argument[3] -= 0.5454545454545454; // aka 1.5 / 2.75
			return change * (7.5625 * argument[3] * argument[3] + 0.75) + argument[1];
		
		} else if argument[3] < 0.9090909090909091 { // aka 2.5 / 2.75
			argument[3] -= 0.8181818181818182 // aka 2.25 / 2.75
			return change * (7.5625 * argument[3] * argument[3] + 0.9375) + argument[1];
		
		} else {
			argument[3] -= 0.9545454545454546; // aka 2.625 / 2.75
			return change * (7.5625 * argument[3] * argument[3] + 0.984375) + argument[1];
		}
		
	case eases.bounce_inout:
		if argument[3] < argument[4] / 2 return floop_tween(eases.bounce_in, 0, change, argument[3] * 2, argument[4]) / 2 + argument[1];
		else return (floop_tween(eases.bounce_out, 0, change, argument[3] * 2 - argument[4], argument[4]) + change) / 2 + argument[1];
}