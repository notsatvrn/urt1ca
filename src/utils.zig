const objc = @import("objc");
const versioning = @import("versioning.zig");

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
