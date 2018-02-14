draw_set_color(c_white);
draw_rectangle(0, window_get_height() - 32, window_get_width(), window_get_height(), 0);

draw_set_color(c_black);
draw_set_font(fnt_main);

var instr = global.test_name + " - left/right to navigate - f1 to restart room";

for (var i = 0; i < array_length_1d(global.instructions); i ++) {
	instr += " - " + global.instructions[i];
}

draw_text(8, window_get_height() - 28, instr);