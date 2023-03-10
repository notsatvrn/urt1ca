const versioning = @import("versioning.zig");

export fn versionString() [*:0]const u8 {
    return @ptrCast([*:0]const u8, &versioning.Version.getCurrent().toString());
}

extern "c" fn appMain() isize;

pub fn main() void {
    _ = appMain();
}
