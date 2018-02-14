var yy = 0, xx = 0;

for (var t = 0; t < 32; t ++) {
	if yy > window_get_height() - 64 {
		yy = 0;
		xx += window_get_width() / 2;
	}
	
	draw_set_color(c_gray);
	draw_text(xx + 16, yy + 16, global.tween_names[t]);
	
	draw_set_color(c_red);
	draw_circle(
		floop_tween(t, xx + 16, xx + 216, time, game_get_speed(gamespeed_fps) * 5),
		yy + 16,
		10, 0
	);
	
	yy += 32;
}