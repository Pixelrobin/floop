draw_set_color(c_red);

for (var t = 0; t < 32; t ++) {
	draw_text(0, 16 + t * 32, string(t));
	draw_circle(
		tween(t, 32, 400, time, game_get_speed(gamespeed_fps) * 5),
		16 + t * 32,
		10, 0
	);
}