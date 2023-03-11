const objc = @import("objc");
const std = @import("std");

pub const Version = extern struct {
    major: i64,
    minor: i64,
    patch: i64,

    pub fn getCurrent() Version {
        const NSProcessInfo = objc.Class.getClass("NSProcessInfo").?;
        const info = NSProcessInfo.msgSend(objc.Object, objc.sel("processInfo"), .{});
        return info.getProperty("operatingSystemVersion").?.value;
    }

    pub fn toString(v: Version) []const u8 {
        var buf: [6]u8 = undefined;
        return std.fmt.bufPrint(&buf, "{}.{}.{}", .{v.major, v.minor, v.patch}) catch "";
    }

    pub fn inRange(v: Version, comptime min: Version, comptime max: Version) bool {
        return versionAtLeast(v, min) and versionAtMost(v, max);
    }

    pub fn versionAtLeast(v: Version, comptime min: Version) bool {
        if (v.major > min.major) {
            return true;
        } else if (v.major < min.major) {
            return false;
        }

        if (v.minor > min.minor) {
            return true;
        } else if (v.minor < min.minor) {
            return false;
        }

        return v.patch >= min.patch;
    }

    pub fn versionAtMost(v: Version, comptime max: Version) bool {
        if (v.major < max.major) {
            return true;
        } else if (v.major > max.major) {
            return false;
        }

        if (v.minor < max.minor) {
            return true;
        } else if (v.minor > max.minor) {
            return false;
        }

        return v.patch <= max.patch;
    }
};
