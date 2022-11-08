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

test "Test ui" {
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

        raylib.gui.Label(.{
            .text = "Hello World",
            .bounds = .{ .x = 10, .y = 10, .width = 100, .height = 30 }
        });

        if (raylib.gui.Button(.{ 
            .text = "Click Me!",
            .bounds = .{ .x = 10, .y = 50, .width = 100, .height = 30 }
        })) {
            raylib.gui.Label(.{
                .text = "GOTCHA!",
                .bounds = .{ .x = 10, .y = 90, .width = 100, .height = 30 }
            });
        }
    }
}