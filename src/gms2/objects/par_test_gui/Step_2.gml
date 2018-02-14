if keyboard_check_pressed(vk_right) && room_next(room) != -1
	then room_goto_next();

if keyboard_check_pressed(vk_left) && room_previous(room) > rm_test_template
	then room_goto_previous();

if keyboard_check_pressed(vk_f1) then room_restart();