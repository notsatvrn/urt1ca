const objc = @import("deps/zig-objc/build.zig");
const std = @import("std");

pub fn build(b: *std.Build) anyerror!void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{
        .preferred_optimize_mode = null,
    });

    if (b.sysroot == null) {
        std.log.warn("You haven't set the path to Apple SDK which may lead to build errors.", .{});
        std.log.warn("Hint: you can the path to Apple SDK with --sysroot <path> flag like so:", .{});
        std.log.warn("  zig build --sysroot $(xcrun --sdk iphoneos --show-sdk-path) -Dtarget=aarch64-ios", .{});
    }

    const exe = b.addExecutable(.{
        .name = "urt1ca",
        .root_source_file = std.Build.FileSource.relative("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .version = try std.builtin.Version.parse("0.0.1"),
        .linkage = null,
    });

    b.default_step.dependOn(&exe.step);

    exe.addCSourceFiles(&[_][]const u8{
        "src/AppMain.m",
        "src/AppDelegate.m",
        "src/Versioning.m",
    }, &[0][]const u8{});

    exe.linkLibC();
    exe.linkFramework("Foundation");
    exe.linkFramework("IOKit");
    exe.linkFramework("UIKit");
    exe.addSystemIncludePath("/usr/include");
    exe.addLibraryPath("/usr/lib");
    exe.addFrameworkPath("/System/Library/Frameworks");
    exe.addModule("objc", objc.module(b));
    exe.install();
}
