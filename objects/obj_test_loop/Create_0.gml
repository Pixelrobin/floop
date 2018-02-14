event_inherited();

global.test_name = "Loop";

fg = floop_group_create();

floop_group_set(fg, "replay", 0);
floop_group_set(fg, "patrol", 0);

floop_group_play(fg, "replay", eases.elastic_inout, 0, 1, game_speed / 3, game_speed * 5, loops.replay);
floop_group_play(fg, "patrol", eases.elastic_inout, 0, 1, game_speed / 3, game_speed * 5, loops.patrol);