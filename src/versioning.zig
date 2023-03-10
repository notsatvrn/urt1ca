const objc = @import("objc");

pub const NSOperatingSystemVersion = extern struct {
    major: i64,
    minor: i64,
    patch: i64,
};

pub fn getVersion() NSOperatingSystemVersion {
    const NSProcessInfo = objc.Class.getClass("NSProcessInfo").?;
    const info = NSProcessInfo.msgSend(objc.Object, objc.sel("processInfo"), .{});
    return info.getProperty("operatingSystemVersion").?;
}

pub fn versionInRange(
    version: NSOperatingSystemVersion,
    comptime min: NSOperatingSystemVersion,
    comptime max: NSOperatingSystemVersion,
) bool {
    return versionAtLeast(version, min) and versionAtMost(version, max);
}

pub fn versionAtLeast(
    version: NSOperatingSystemVersion,
    comptime min: NSOperatingSystemVersion,
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

    if (version.patch >= min.patch) {
        return true;
    } else {
        return false;
    }
}

pub fn versionAtMost(
    version: NSOperatingSystemVersion,
    comptime max: NSOperatingSystemVersion,
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

    if (version.patch <= max.patch) {
        return true;
    } else {
        return false;
    }
}

