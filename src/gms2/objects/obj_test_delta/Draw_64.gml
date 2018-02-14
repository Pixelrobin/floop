draw_debug_circles(fg, keys);

draw_set_color(c_white);
draw_set_font(fnt_main);

var w2 = string_width(string(delta)) / 2,
	mx = window_mouse_get_x(),
	my = window_mouse_get_y(),
	sd = string(delta);

draw_rectangle(mx - w2, my - string_height(sd), mx + w2, my, 0);

draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_text(mx, my, sd);

draw_set_halign(fa_left);
draw_set_valign(fa_top);