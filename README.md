# urt1ca

A semi-untethered jailbreak for iOS 9-15.1.1.

## IMPORTANT INFO

This jailbreak is HIGHLY experimental! Exploits may be dropped or added during the development process.

A key for labeling the status of features/exploits may be found below.

| Symbol | Meaning |
| --- | --- |
| x | Not yet implemented. May be dropped. |
| ? | In progress. May be dropped. |
| ! | Working, but with bugs. |
| * | Working. |

Also, PLEASE do not spam me asking about ETAs and such. I will not entertain this kind of behavior. This is a passion project of mine, I will not let it become a chore.

## Features

- Support for many versions and devices.
- Untether for iOS 9.0-14.? (x)

## iOS Version Support

- 9.0-9.3.4 (Trident) (x)
- 9.3.5-9.3.6 (phoenix) (x)
- 10-
- 12.0-14.3 (cicuta_virosa)
- 14.4-14.7 (IOMFB exploit w/ CVE-2021-30807)
- 15.0-15.1.1 (desc_race OR multicast_bytecopy) (could maybe cover other iOS 14 versions)
- (ON A10+) 12.1-15.5 (weightBufs)
- (ON A10+) 15.6-15.7.1 (weightBufs + DER Entitlements) (still researching)

## Credits

- [zig-ios-example](https://github.com/kubkon/zig-ios-example) for figuring out the structure of the project.
- [Siguza](https://github.com/Siguza) for [IOKit headers](https://github.com/Siguza/iokit-utils/blob/master/src/iokit.h).
- [Brandon Azad](https://github.com/bazad) for [IOSurface definitions](https://bugs.chromium.org/p/project-zero/issues/detail?id=1986#c4).
