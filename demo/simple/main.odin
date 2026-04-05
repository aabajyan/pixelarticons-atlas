package main

import pixelarticons "../.."
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
