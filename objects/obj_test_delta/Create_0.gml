event_inherited();
global.test_name = "Delta";
global.instructions = ["Move mouse to change update delta"];

keys = [];
fg = floop_group_create();
delta = 0;

for (var t = FLOOP_TOTAL_EASES; t >= 0; t --) {
	keys[t] = t;
	floop_group_play(fg, t, t, 0, 1, 0, game_speed * 5, loops.patrol);
}