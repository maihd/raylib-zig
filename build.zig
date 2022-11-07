const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();
    const step = lib(b, target, mode);
    step.install();

    // Add test step

    const main_tests = b.addTest("src/main.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);

    // Example applications

    installExample(b, example_basic_builder.build(b, target, mode), example_basic_builder.name);
}

pub fn lib(b: *std.build.Builder, target: std.zig.CrossTarget, mode: std.builtin.Mode) *std.build.LibExeObjStep {
    const step = b.addStaticLibrary("raylib-zig", "src/main.zig");
    step.setBuildMode(mode);
    step.setTarget(target);

    return step;
}

pub fn installExample(b: *std.build.Builder, exe: *std.build.LibExeObjStep, comptime name: []const u8) void {
    // TODO: Problems with LTO on Windows.
    exe.want_lto = false;
    exe.strip = exe.build_mode == .ReleaseFast;

    comptime var desc_name: [name.len]u8 = [_]u8{0} ** name.len;
    comptime _ = std.mem.replace(u8, name, "_", " ", desc_name[0..]);
    comptime var desc_size = desc_name.len;

    const install = b.step(name, "Build '" ++ desc_name[0..desc_size] ++ "' example");
    install.dependOn(&b.addInstallArtifact(exe).step);

    const run_step = b.step(name ++ "_run", "Run '" ++ desc_name[0..desc_size] ++ "' example");
    const run_cmd = exe.run();
    run_cmd.step.dependOn(install);
    run_step.dependOn(&run_cmd.step);

    b.getInstallStep().dependOn(install);
}

const example_basic_builder = @import("examples/basic/build.zig");