/// @desc tween a value
/// @param ease     Easing equation to use (argument0)
/// @param start    Starting value         (argument1)
/// @param end      Ending value           (argument2)
/// @param time     Current time           (argument3)
/// @param duration Duration of ease       (argument4)
/// @param optional Extra arguments        (argument5)

// Excuse me, I think you have a script in your arguments

var change = argument[2] - argument[1];

switch argument[0] {
	// MISC
	case eases.sudden:
		return argument[3] >= argument[4] ? argument[2] : argument[1];
	
	case eases.linear:
		return change * argument[3] / argument[4] + argument[1];
	
	
	// SINE
	case eases.sine_in:
		return -change * cos(argument[3] / argument[4] * (pi / 2)) + change + argument[1];
	
	case eases.sine_out:
		return change * cos(argument[3] / argument[4] * (pi / 2)) + argument[1];
	
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
		if (argument[3] > 1) return change / 2 * power(2, 10 * (argument[3] - 1)) + argument[1];
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
	
	
	// BACK (argument5 = overshoot)
	case eases.back_in:
		argument[3] /= argument[4];
		return change * argument[3] * argument[3] * ((argument[5] + 1) * argument[3] - argument[5]) + argument[1];
	
	case eases.back_out:
		argument[3] = argument[3] / argument[4] - 1;
		return change * (argument[3] * argument[3] * ((argument[5] + 1) * argument[3] + argument[5]) + 1) + argument[1];
		
	case eases.back_inout:
		argument[5] *= 1.525;
		argument[1] /= argument[4] / 2;
		if argument[3] < 1 return change / 2 * (argument[3] * argument[3] * ((argument[5] + 1) * argument[3] - argument[5])) + argument[1];
		argument[3] -= 2;
		return change / 2 * (argument[3] * argument[3] * ((argument[5] + 1) * argument[3] + argument[5]) + 2) + argument[1];
	
	// ELASTIC (argument5 = amplitude, argument6 = period)
	case eases.elastic_in:
		var s;
		
		if argument[3] <= 0 return argument[1];
		
		argument[3] /= argument[4];
		if argument[3] >= 1 return argument[2];
		
		if is_undefined(argument[6]) argument[6] = argument[4] * 0.3;
		if is_undefined(argument[5]) || argument[5] < abs(change) {
			argument[5] = change;
			s = argument[6] / 4;
		} else s = argument[6] / (2 * pi) * arcsin(change/argument[5]);
		
		argument[3] --;
		return -(argument[5] * power(2, 10 * argument[3]) * sin((argument[3] * argument[4] - s) * (2 * pi) / argument[6])) + argument[1];
	
	case eases.elastic_out:
		var s;
		
		if argument[3] <= 0 return argument[1];
		
		argument[3] /= argument[4];
		if argument[3] >= 1 return argument[2];
		
		if is_undefined(argument[6]) argument[6] = argument[4] * 0.3;
		if is_undefined(argument[5]) || argument[5] < abs(change) {
			argument[5] = change;
			s = argument[6] / 4;
		} else s = argument[6] / (2 * pi) * arcsin(change / argument[5]);
		
		return argument[5] * power(2, -10 * argument[3]) * sin((argument[3] * argument[4] - s) * (2 * pi) / argument[6]) + change + argument[1];
	
	/*case eases.elastic_inout:
		var s;
		
		if argument[3] <= 0 return argument[1];
		
		argument[3] / argument[4] * 2*/
	
	// BOUNCE
}