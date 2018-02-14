var t;

draw_set_font(fnt_main);
draw_set_color(c_white);

for (t = 0; t < 5; t ++) {
	draw_text(16, 16 + 24 * t,
		floop_group_get(
			fg,
			t,
			string(t) + ": floop group value is not defined. Press " + string(t) + " to set it to something random."
		)
	);
}