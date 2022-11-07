const c = @cImport({
    @cInclude("raylib.h");
});

// Window

pub const WindowDesc = struct {
    title: [*c]const u8,
    width: i32,
    height: i32,
    framerate: i32 = 60
};

pub inline fn initWindow(desc: WindowDesc) void {
    c.InitWindow(desc.width, desc.height, desc.title);
    c.SetTargetFPS(desc.framerate);
}

pub inline fn closeWindow() void {
    c.CloseWindow();
}

pub inline fn windowShouldClose() bool {
    return c.WindowShouldClose();
}

pub inline fn setTargetFramerate(fps: i32) void {
    c.SetTargetFPS(fps);
}

// Graphics

pub const Color = c.Color;

pub const WHITE = c.WHITE;
pub const RAYWHITE = c.RAYWHITE;
pub const LIGHTGRAY = c.LIGHTGRAY;

pub inline fn beginDrawing() void {
    c.BeginDrawing();
} 

pub inline fn endDrawing() void {
    c.EndDrawing();
}

pub inline fn clearBackground(color: Color) void {
    c.ClearBackground(color);
}

pub inline fn drawText(args: struct {
    text: [:0]const u8,
    x: i32,
    y: i32,
    fontSize: i32,
    color: Color,
}) void { 
    c.DrawText(@ptrCast([*c]const u8, args.text), args.x, args.y, args.fontSize, args.color);
}