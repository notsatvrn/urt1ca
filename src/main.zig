const versioning = @import("versioning.zig");
const utils = @import("exploits/utils.zig");

export fn versionString() [*:0]const u8 {
    return @ptrCast([*:0]const u8, &versioning.Version.getCurrent().toString());
}

extern "c" fn appMain() isize;

pub fn main() void {
    _ = utils.messageSizeForKallocSize(100);
    _ = appMain();
}
