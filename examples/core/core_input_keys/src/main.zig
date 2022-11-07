const std = @import("std");
const raylib = @import("raylib");

pub fn main() !void {
    const window_desc = raylib.WindowDesc{
        .title = "raylib [core] example - keyboard input",
        .width = 800,
        .height = 450,
        .framerate = 60
    };

    raylib.initWindow(window_desc);
    defer raylib.closeWindow();

    var ball_x = @as(f32, window_desc.width / 2);
    var ball_y = @as(f32, window_desc.height / 2);

    while (!raylib.windowShouldClose()) {
        if (raylib.isKeyDown(raylib.Key.Left))  ball_x -= 2.0;
        if (raylib.isKeyDown(raylib.Key.Right)) ball_x += 2.0;
        if (raylib.isKeyDown(raylib.Key.Up))    ball_y -= 2.0;
        if (raylib.isKeyDown(raylib.Key.Down))  ball_y += 2.0;

        raylib.beginDrawing();
        defer raylib.endDrawing();

        raylib.clearBackground(raylib.RAYWHITE);

        raylib.drawText(.{
            .text = "Congrats! You created your first window!", 
            .x = 10, 
            .y = 10, 
            .font_size = 20, 
            .color = raylib.DARKGRAY
        });

        raylib.drawCircle(.{
            .x = ball_x, 
            .y = ball_y,
            .radius = 50.0,
            .color = raylib.MAROON
        });
    }
}