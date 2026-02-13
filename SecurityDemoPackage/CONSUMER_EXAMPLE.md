# Consumer Example - Demonstrating SPM Security Gap

This document shows how easy it is to consume a Swift package without any cryptographic verification, demonstrating the security gap in Swift Package Manager.

## Creating a Consumer App

1. Create a new Swift package or iOS app
2. Add this package as a dependency in `Package.swift`:

```swift
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ConsumerApp",
    dependencies: [
        .package(url: "https://github.com/YOUR_USERNAME/SecurityDemoPackage.git", from: "1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "ConsumerApp",
            dependencies: ["SecurityDemoPackage"]
        )
    ]
)
```

3. Use the package in your code:

```swift
import SecurityDemoPackage

// This code will execute without any verification of the package's authenticity
let result = SecurityDemo.greet("World")
print(result)

// Process sensitive data through an unverified package
let processed = SecurityDemo.processData("sensitive-user-data")
print(processed)
```

## The Security Problem

When you run `swift package resolve` or build your app:

1. ✅ SPM downloads the package from GitHub
2. ❌ **NO cryptographic signature verification**
3. ❌ **NO checksum validation**
4. ❌ **NO publisher identity verification**
5. ✅ Code executes with full app permissions

## Attack Scenario

An attacker could:
1. Compromise the GitHub repository
2. Replace legitimate code with malicious code
3. Your app would automatically download and execute the malicious code
4. No warning or verification step would alert you

## Comparison with Other Ecosystems

- **Java/Maven**: GPG signature verification available
- **Python/PyPI**: Package signing and verification supported
- **Go**: Checksum database and module authentication
- **C#/NuGet**: Package signing and repository signatures
- **Swift/SPM**: ❌ No built-in verification mechanism

This demonstrates a critical security gap in Swift's package management ecosystem.