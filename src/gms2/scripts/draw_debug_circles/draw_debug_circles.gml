/// @desc Used for tests, draws some debug cirles

/// @arg floop_group_id Id of the floop group
/// @arg keys           Array of keys to draw

var yy = 0, xx = 0;

for (var t = 0; t < array_length_1d(argument1); t ++) {
	if yy > window_get_height() - 64 {
		yy = 0;
		xx += window_get_width() / 2;
	}
	
	draw_set_color(c_gray);
	draw_text(xx + 16, yy + 16, argument1[t]);
	
	draw_set_color(c_red);
	draw_circle(
		xx + 16 + (200 * floop_group_get(argument0, argument1[t], 0)),//floop_tween(t, xx + 16, xx + 216, time, game_get_speed(gamespeed_fps) * 5),
		yy + 16,
		10, 0
	);
	
	yy += 32;
}