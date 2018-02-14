floop_group_update(fg);

if string_length(keyboard_string) > 0 {
	var k, n;
	
	keyboard_string = string_digits(keyboard_string);
	
	for (k = 0; k < string_length(keyboard_string); k ++) {
		n = real(string_char_at(keyboard_string, k + 1));
		
		if n >= 0 && n < 5 {
			floop_group_cancel(fg, n, keyboard_check(vk_up));
		}
	}
	
	keyboard_string = "";
}

if keyboard_check_pressed(vk_space)
	then floop_group_cancel(fg, FLOOP_ALL, keyboard_check(vk_up));