event_inherited();
global.test_name = "Cancel";
global.instructions = [
	"1-5 to cancel tween",
	"hold up to wait on cancel",
	"space to cancel all"
];

var t;

keys = [0, 1, 2, 3, 4];
fg = floop_group_create();

for (t = 0; t < 5; t ++) {
	floop_group_set(fg, t, 0);
	floop_group_play(fg, t, irandom(FLOOP_TOTAL_EASES), 0, 1, 0, game_speed * 3, loops.patrol);
}

keyboard_string = "";