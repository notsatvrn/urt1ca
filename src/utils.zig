const versioning = @import("versioning.zig");
//const objc = @import("objc");
const std = @import("std");

var gpa = std.heap.GeneralPurposeAllocator(.{}){};
pub var alloc = gpa.allocator();

// WIP
// https://adamdemasi.com/2019/08/25/respring-the-right-way-followup.html
pub fn respring() void {
    //const SBSRelaunchAction = objc.Class.GetClass("SBSRelaunchAction").?;

    if (versioning.versionAtLeast(versioning.getVersion(), .{9,3,0})) {
        // 9.3+
    } else {
        // 8.0 - 9.2
    }
}

pub fn errorf(comptime fmt: []const u8, args: anytype) void {
    std.debug.print("ERROR: {}", .{std.fmt.AllocPrint(alloc, fmt, args)});
}

pub fn warnf(comptime fmt: []const u8, args: anytype) void {
    std.debug.print("WARN: {}", .{std.fmt.AllocPrint(alloc, fmt, args)});
}

pub fn infof(comptime fmt: []const u8, args: anytype) void {
    std.debug.print("INFO: {}", .{std.fmt.AllocPrint(alloc, fmt, args)});
}
