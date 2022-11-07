const std = @import("std");
const raylib = @import("../../../build.zig");

pub const name = "core_input_keys";

pub fn build(b: *std.build.Builder, target: std.zig.CrossTarget, mode: std.builtin.Mode) *std.build.LibExeObjStep {
    const src_dir = thisDir() ++ "/src";
    const exe = b.addExecutable("core_input_keys", src_dir ++ "/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);

    raylib.link(exe);
    exe.addPackage(raylib.pkg);

    return exe;
}

inline fn thisDir() []const u8 {
    return comptime std.fs.path.dirname(@src().file) orelse ".";
}