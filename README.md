# urt1ca

A semi-untethered jailbreak for iOS 9.0-15.1.1.

## Important Info

This jailbreak is HIGHLY experimental! Exploits may be dropped or added during the development process.

Explanations of statuses on features/exploits may be found below.

| Status | Meaning |
| --- | --- |
| `?` | In research. |
| `X` | Implementation not started. |
| `*` | Implementation in progress. |
| `!` | Implemented but not tested. |
| `$` | Implemented and confirmed to work. |

## Features

- Support for many versions and devices.
- Untether for iOS 9.0-14.? (`?`).

## iOS Version Support

Support is planned for iOS 9.0-15.1.1 and 15.2-15.7.1 on A10+.

| Versions | Exploits | Status |
| --- | --- | --- |
| 9.0-9.3.4 | Trident | `?` |
| 9.3.5-9.3.6 | phoenix | `?` |
| 10.0-12.0 | sock_port | `X` |
| 12.0-14.3 | cicuta_virosa | `X` |
| 14.4-14.7 | IOMFB exploit (CVE-2021-30807) | `?` |
| 15.0-15.1.1 | desc_race / multicast_bytecopy | `?` |
| 15.2-15.5 (A10+) | weightBufs | `?` |
| 15.6-15.7.1 (A10+) | weightBufs + DER Entitlements | `?` |

## Credits

- [zig-ios-example](https://github.com/kubkon/zig-ios-example) for the structure of the project.
- [Siguza](https://github.com/Siguza) for [IOKit headers](https://github.com/Siguza/iokit-utils/blob/master/src/iokit.h).
- [Brandon Azad](https://github.com/bazad) for [IOSurface definitions](https://bugs.chromium.org/p/project-zero/issues/detail?id=1986#c4).
