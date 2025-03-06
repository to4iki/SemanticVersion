import Testing

@testable import SemanticVersion

// MARK: - 初期化テスト

@Test(arguments: [
  (string: "2.3.4", major: 2, minor: 3, patch: 4),
  (string: "0.1.0", major: 0, minor: 1, patch: 0),
  (string: "10.20.30", major: 10, minor: 20, patch: 30),
])
func initWithValidString(string: String, major: Int, minor: Int, patch: Int) async throws {
  let version = SemanticVersion(string: string)

  #expect(version != nil)
  #expect(version?.major == major)
  #expect(version?.minor == minor)
  #expect(version?.patch == patch)
}

@Test(arguments: ["invalid", "1.2", "1.2.three", "1.2.3.4", "", "a.b.c"])
func initWithInvalidString(invalidString: String) async throws {
  #expect(SemanticVersion(string: invalidString) == nil)
}

@Test func initWithStringLiteral() async throws {
  let version: SemanticVersion = "1.2.3"
  #expect(version.major == 1)
  #expect(version.minor == 2)
  #expect(version.patch == 3)
}

// MARK: - 比較テスト

@Test(arguments: [
  (v1: "1.0.0", v2: "2.0.0", result: true),
  (v1: "2.0.0", v2: "2.1.0", result: true),
  (v1: "2.1.0", v2: "2.1.1", result: true),
  (v1: "1.0.0", v2: "1.0.0", result: false),
  (v1: "2.0.0", v2: "1.0.0", result: false),
])
func compareLessThan(v1: String, v2: String, result: Bool) async throws {
  let version1: SemanticVersion = SemanticVersion(string: v1)!
  let version2: SemanticVersion = SemanticVersion(string: v2)!

  #expect((version1 < version2) == result)
}

@Test(arguments: [
  (v1: "1.0.0", v2: "1.0.0", result: true),
  (v1: "2.0.0", v2: "2.0.0", result: true),
  (v1: "1.0.0", v2: "1.0.1", result: false),
  (v1: "1.0.0", v2: "2.0.0", result: false),
])
func compareEqual(v1: String, v2: String, result: Bool) async throws {
  let version1: SemanticVersion = SemanticVersion(string: v1)!
  let version2: SemanticVersion = SemanticVersion(string: v2)!

  #expect((version1 == version2) == result)
}

// MARK: - 文字列表現テスト

@Test(arguments: [
  (major: 1, minor: 2, patch: 3, expected: "1.2.3"),
  (major: 0, minor: 0, patch: 1, expected: "0.0.1"),
  (major: 10, minor: 20, patch: 30, expected: "10.20.30"),
])
func description(major: Int, minor: Int, patch: Int, expected: String) async throws {
  let version = SemanticVersion(major: major, minor: minor, patch: patch)
  #expect(version.description == expected)
}
