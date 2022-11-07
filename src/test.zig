const raylib = @import("main.zig");

test "Test window" {
    raylib.initWindow(.{
        .title = "Basic Raylib",
        .width = 800,
        .height = 600
    });
    defer raylib.closeWindow();

    while (!raylib.windowShouldClose()) {
        raylib.beginDrawing();
        defer raylib.endDrawing();

        raylib.clearBackground(raylib.WHITE);
    }
}