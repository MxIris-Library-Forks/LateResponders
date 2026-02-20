# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

LateResponders is an Objective-C framework (with Swift tests) that enables "late responder" chains — a mechanism to insert additional responders into the UIKit/AppKit responder chain with weighted ordering. Originally by [Outer Corner](https://github.com/OuterCorner).

## Build Commands

Both SwiftPM and Xcode project are supported. Prefer SwiftPM for simplicity.

```bash
# Build (SwiftPM)
swift build 2>&1 | xcsift

# Run all tests
swift test 2>&1 | xcsift

# Build via Xcode (iOS Simulator)
xcodebuild -project LateResponders.xcodeproj -scheme LateResponders -sdk iphonesimulator build 2>&1 | xcsift

# Run tests via Xcode
xcodebuild test -project LateResponders.xcodeproj -scheme LateResponders -destination 'platform=iOS Simulator,name=iPhone 16' 2>&1 | xcsift
```

No linter is configured. No CI pipeline exists.

## Architecture

### Core Concept

The framework inserts a weighted sub-chain of "late responders" into the standard responder chain. `OCLateResponderRegistry` manages this sub-chain, ordering responders by ascending `weight` and wiring them between an `initialResponder` and `lastResponder`.

### Key Classes

| ObjC Name | Swift Name | Role |
|---|---|---|
| `OCLateResponderRegistry` | `LateResponderRegistry` | Manages the ordered list of late responders; rebuilds chain on register/deregister; posts `OCLateResponderRegistryDidUpdateNotification` |
| `OCLateResponder` | `LateResponder` | Base class with `weight` property; associates with a registry; supports `keyCommandsBlock` on iOS |
| `OCLateResponderProxy` | `LateResponderProxy` | Forwards messages to a proxied responder via ObjC message forwarding; `proxiedSelectorNames` limits which selectors are forwarded |
| `OCResponder` | `Responder` | Platform responder subclass; on iOS supports `nextResponderBlock` for dynamic chain wiring (not available on macOS due to AppKit ivar access) |
| `OCLateResponderRegistering` | `LateResponderRegistering` | Protocol + Category that walks the responder/VC hierarchy to find the nearest registry |

### Cross-Platform Support

- `OCMacros.h` defines `InterfaceKitResponder` (UIResponder/NSResponder) and `InterfaceKitViewController` (UIViewController/NSViewController)
- `OCInterfaceKit.h` imports AppKit or UIKit based on compile target
- Supported platforms: macOS 10.13+, iOS 12+, tvOS 12+, Mac Catalyst 13+, visionOS 1+

### Public Headers

The umbrella header is `LateResponders.h`. SwiftPM public headers are symlinked under `LateResponders/include/LateResponders/`.

## Code Conventions

- All source is Objective-C with `OC` prefix for class names
- All classes use `NS_SWIFT_NAME` annotations for clean Swift API names
- Nullability annotations (`nullable`, `nonnull`) are used throughout
- Conditional compilation via `TARGET_OS_IPHONE` separates iOS/macOS behavior
- Tests are written in Swift using XCTest
