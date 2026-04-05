# Pixelarticons Atlas

Use [PixelartIcons](https://pixelarticons.com/) outside of the web - icon and cursor atlases, free icons only.

This project is made for personal use (Odin + raylib), but feel free to use it or contribute if it helps your own projects.

## Usage (Odin)

You can either copy this into your project or add it as a submodule.
Then you can draw an icon like this:

```odin
package main

import "path/to/pixelarticons"
import rl "vendor:raylib"

main :: proc() {
	rl.InitWindow(320, 240, "Hello Pixelarticons!")
	rl.SetTargetFPS(60)
	defer rl.CloseWindow()

	atlas := rl.LoadTexture(pixelarticons.ICON_ATLAS_PATH)
	defer rl.UnloadTexture(atlas)
	rl.SetTextureFilter(atlas, .POINT)

	icon := pixelarticons.ICON_RECTS[.RobotFaceHappySharp]
	destination := rl.Rectangle {
		x      = 112,
		y      = 72,
		width  = icon.width * 4,
		height = icon.height * 4,
	}

	for !rl.WindowShouldClose() {
		rl.BeginDrawing()
		rl.ClearBackground(rl.RAYWHITE)
		rl.DrawTexturePro(atlas, icon, destination, rl.Vector2{}, 0, rl.GRAY)
		rl.EndDrawing()
	}
}
```

## TODOs

- [ ] Add the script used to generate this 
- [ ] Add an example to preview all icons/cursors at once 

# License

It is licensed under MIT same as the [Pixelarticons](https://github.com/halfmage/pixelarticons/blob/master/LICENSE).