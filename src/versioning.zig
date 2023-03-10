const std = @import("std");

extern "c" fn getCurrentVersion() Version;

pub const Version = extern struct {
    major: i64,
    minor: i64,
    patch: i64,

    pub fn getCurrent() Version {
        return getCurrentVersion();
    }

    pub fn toString(v: Version) []const u8 {
        var buf: [8]u8 = undefined;
        return std.fmt.bufPrint(&buf, "{}.{}.{}", .{v.major, v.minor, v.patch}) catch "";
    }

    pub fn inRange(
        version: Version,
        comptime min: Version,
        comptime max: Version,
    ) bool {
        return versionAtLeast(version, min) and versionAtMost(version, max);
    }

    pub fn versionAtLeast(
        version: Version,
        comptime min: Version,
    ) bool {
        if (version.major > min.major) {
            return true;
        } else if (version.major < min.major) {
            return false;
        }

        if (version.minor > min.minor) {
            return true;
        } else if (version.minor < min.minor) {
            return false;
        }

        return version.patch >= min.patch;
    }

    pub fn versionAtMost(
        version: Version,
        comptime max: Version,
    ) bool {
        if (version.major < max.major) {
            return true;
        } else if (version.major > max.major) {
            return false;
        }

        if (version.minor < max.minor) {
            return true;
        } else if (version.minor > max.minor) {
            return false;
        }

        return version.patch <= max.patch;
    }
};
