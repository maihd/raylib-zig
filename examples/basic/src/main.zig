const std = @import("std");
const raylib = @import("raylib");

pub fn main() !void {
    raylib.initWindow(.{
        .title = "Basic Raylib",
        .width = 800,
        .height = 450
    });
    defer raylib.closeWindow();

    while (!raylib.windowShouldClose()) {
        raylib.beginDrawing();
        defer raylib.endDrawing();

        raylib.clearBackground(.{ .r = 255, .g = 255, .b = 255, .a = 255 });
        raylib.drawText(.{
            .text = "Congrats! You created your first window!", 
            .x = 190, 
            .y = 200, 
            .fontSize = 20, 
            .color = raylib.LIGHTGRAY
        });
    }
}