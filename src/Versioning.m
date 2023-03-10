#import <Foundation/Foundation.h>

NSOperatingSystemVersion getCurrentVersion() {
    return [[NSProcessInfo processInfo] operatingSystemVersion];
}
