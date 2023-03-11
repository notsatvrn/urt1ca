#import <Foundation/Foundation.h>

NSOperatingSystemVersion getCurrentVersion() {
    @autoreleasepool {
        return [[NSProcessInfo processInfo] operatingSystemVersion];
    }
}
