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
pub const MAROON = c.MAROON;
pub const RAYWHITE = c.RAYWHITE;
pub const DARKGRAY = c.DARKGRAY;
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
    font_size: i32,
    color: Color,
}) void { 
    c.DrawText(@ptrCast([*c]const u8, args.text), args.x, args.y, args.font_size, args.color);
}

pub inline fn drawCircle(args: struct {
    x: f32,
    y: f32,
    radius: f32,
    color: Color,
}) void {
    c.DrawCircleV(c.Vector2{ .x = args.x, .y = args.y }, args.radius, args.color);
}

// Input

pub const Key = enum(c_int) {
    Up      = c.KEY_UP,
    Down    = c.KEY_DOWN,
    Left    = c.KEY_LEFT, 
    Right   = c.KEY_RIGHT,
};

pub inline fn isKeyDown(key: Key) bool {
    return c.IsKeyDown(@enumToInt(key));
}