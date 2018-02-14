if string_length(keyboard_string) > 0 {
	var k, n;
	
	keyboard_string = string_digits(keyboard_string);
	
	for (k = 0; k < string_length(keyboard_string); k ++) {
		n = real(string_char_at(keyboard_string, k + 1));
		
		if n >= 0 && n < 5 {
			floop_group_set(fg, n, irandom(100));
		}
	}
	
	keyboard_string = "";
}

if keyboard_check_pressed(vk_space)
	then floop_group_set(fg, FLOOP_ALL, irandom(100));