if keyboard_check_pressed(ord("1"))
	then floop_group_play(fg, 0, irandom(FLOOP_TOTAL_EASES), 1, 0, 0, game_speed, loops.patrol);
	
if keyboard_check_pressed(ord("2")) {
	for (var l = 0; l < 5; l ++) {
		floop_group_play(fg, l, irandom(FLOOP_TOTAL_EASES), 1, 0, 0, game_speed, loops.patrol);
	}
}

floop_group_update(fg);