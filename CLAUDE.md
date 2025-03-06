# CLAUDE.md - Assistant Guidelines for SemanticVersion

## Build & Test Commands
- Build: `swift build`
- Test all: `swift test --parallel`
- Test single: `swift test --filter "SemanticVersionTests.<TestClass>/<testMethod>"`
- Lint: `swift format lint -r Sources Tests`
- Format code: `swift format -r Sources Tests -i`
- Generate Xcode project: `swift package generate-xcodeproj`

## Code Style Guidelines
- **Architecture**: Value-type oriented design, immutable where possible
- **Naming**: camelCase for variables/functions, PascalCase for types, UPPERCASE for constants
- **Formatting**: 2-space indentation, 100 character line limit
- **Types**: Always use explicit type annotations for public APIs
- **Documentation**: Document all public APIs with triple-slash (///) Swift-style comments
- **Access Control**: Use `public` only when necessary, prefer `internal` by default
- **Error Handling**: Custom errors should conform to `Error` protocol, descriptive enum cases
- **Version Parsing**: Follow SemVer 2.0.0 spec strictly (MAJOR.MINOR.PATCH[-PRERELEASE][+BUILD])
- **Testing**: Unit test all parsing and comparison logic
- **Performance**: Optimize for parsing speed and low memory footprint

This library implements Semantic Versioning for Swift 6 according to the SemVer 2.0.0 specification.
