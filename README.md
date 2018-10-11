# floop
Floop is a tweening library built for Gamemaker Studio 2, with the intent to be lightweight and fast as well as easy to use. Floop introduces `floop_groups`, which are `ds_maps` with tweenable values you can queue up.

It's not quite v1.0 ready, but it's close!

The library was created out of frustration from manually hardcoding blocks of code to manage my tween states. Instead of keeping track of a tween's time, etc, floop groups allow you to simply "fire and forget".

```gml
// --- CREATE EVENT ---
fg = floop_group_create();

// Set up all the tweens
var offset = floop_group_play(fg, "y_offset", eases.back_out, room_height, room_height / 2, 0, 30);
offset = floop_group_play(fg, "scale", eases.quint_out, 1, 2, offset / 2, 20);
floop_group_play(fg, "rotation", eases.bounce_out, 0, 360, offset, 50);

// --- STEP EVENT ---
floop_group_update(fg);

// --- DRAW EVENT ---
draw_sprite_ext(
	sprite_index, image_index, x,
	floop_group_get(fg, "y_offset"),
	floop_group_get(fg, "scale"),
	floop_group_get(fg, "scale"),
	floop_group_get(fg, "rotation"),
	c_red, 1
);
```

(Code from the [Getting Started](https://github.com/Pixelrobin/floop-gms/wiki/Getting-Started) page in the wiki)

## Compatibility
Currently, floop was only tested on **Gamemaker Studio 2**. However, it was built with GMS 1.4 compatibility in mind. It _probably_ works, but not officially. GMS 1.4 support is planned.

## Installation
wip!
