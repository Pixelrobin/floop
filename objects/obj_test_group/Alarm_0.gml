var o, n, gs = game_get_speed(gamespeed_fps);

tween = (tween + 1) % 32; n = floop_group_play(fg, "x", tween, 64, 264, 0, gs);
tween = (tween + 1) % 32; n = floop_group_play(fg, "y", tween, 64, 264, n, gs);
tween = (tween + 1) % 32; n = floop_group_play(fg, "x", tween, 264, 64, n, gs);
tween = (tween + 1) % 32; n = floop_group_play(fg, "y", tween, 264, 64, n, gs);

alarm[0] = n;