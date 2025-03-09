# SemanticVersion
![Swift 6](https://img.shields.io/badge/swift-6-orange.svg)
![SPM compatible](https://img.shields.io/badge/SPM-Compatible-brightgreen.svg)
![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)

A Simple Semantic Versioning implementation.

## Installation
### Swift Package Manager
```swift
.package(url: "https://github.com/to4iki/SemanticVersion", from: <#version#>)
```

## Usage
```swift
// Initialize directly
let version1 = SemanticVersion(major: 1, minor: 2, patch: 3)
print(version1) // 1.2.3

// Initialize from string
if let version2 = SemanticVersion(string: "2.0.0") {
    print(version2) // 2.0.0
}

// Initialize from string with only major and minor version
if let version2a = SemanticVersion(string: "2.0") {
    print(version2a) // 2.0.0 (patch version will be 0)
}

// Initialize with string literal
let version3: SemanticVersion = "1.0.0"

// Compare versions
if version1 < version3 {
    print("version1 is lower than version3")
}

// Check for equality
if version3 == SemanticVersion(string: "1.0.0")! {
    print("Versions are equal")
}
```

## License
SemanticVersion is released under the MIT license.
