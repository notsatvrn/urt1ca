const versioning = @import("versioning.zig");
const objc = @import("objc");
const std = @import("std");

//var gpa = std.heap.GeneralPurposeAllocator(.{}){};
//pub var alloc = gpa.allocator();
pub var alloc = std.heap.c_allocator;

// https://adamdemasi.com/2019/08/25/respring-the-right-way-followup.html
pub fn respring() void {
    var relaunch_action = objc.Object{};

    if (versioning.versionAtLeast(versioning.getVersion(), .{9,3,0})) {
        var SBSRelaunchAction = objc.Class.GetClass("SBSRelaunchAction").?;
        var SBSRelaunchActionOptionsFadeToBlackTransition = objc.Class.GetClass("SBSRelaunchActionOptionsFadeToBlackTransition").?;
        relaunch_action = SBSRelaunchAction.msgSend(
            objc.Object,
            objc.Sel("actionWithReason:options:targetURL:"),
            .{"RelaunchServerAction", SBSRelaunchActionOptionsFadeToBlackTransition, null},
        );
    } else {
        var SBSRestartRenderServerAction = objc.Class.GetClass("SBSRestartRenderServerAction").?;
        relaunch_action = SBSRestartRenderServerAction.msgSend(
            objc.Object,
            objc.Sel("restartActionWithTargetRelaunchURL:"),
            .{null},
        );
    }

    var FBSSystemService = objc.Class.getClass("FBSSystemService").?;
    var shared_service = FBSSystemService.msgSend(objc.Object, objc.sel("sharedService"), .{});
    var NSSet = objc.Class.getClass("NSSet").?;
    var action_set = NSSet.msgSend(objc.Object, objc.Sel("setWithObject:"), .{relaunch_action});
    shared_service.msgSend(void, objc.Sel("sendActions:withResult:"), .{action_set, null});
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
