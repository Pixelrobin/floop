draw_set_color(c_red);

for (var t = 0; t < 25; t ++) {
	draw_circle(
		tween(t, 16, 400, time, game_get_speed(gamespeed_fps) * 5, 16),
		16 + t * 32,
		10, 0
	);
}