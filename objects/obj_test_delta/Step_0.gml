delta = clamp(window_mouse_get_x() / window_get_width(), 0, 1);

floop_group_update(
	fg,
	delta
);