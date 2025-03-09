/// xx.yy.zz 形式のセマンティックバージョンを表す構造体
///
/// プレリリース情報やビルドメタデータはサポートしていません
/// - Note: https://semver.org/lang/ja/
public struct SemanticVersion: Equatable, Sendable {
  public let major: Int
  public let minor: Int
  public let patch: Int

  public init(major: Int, minor: Int, patch: Int) {
    self.major = major
    self.minor = minor
    self.patch = patch
  }

  /// 文字列から `SemanticVersion` を生成するイニシャライザ
  ///
  /// - Parameter string: "major.minor.patch" または "major.minor" 形式の文字列
  /// - Returns: 正しいフォーマットならインスタンスを返し、そうでなければ nil を返す
  public init?(string: String) {
    let components = string.split(separator: ".")

    if components.count == 3,
      let major = Int(components[0]),
      let minor = Int(components[1]),
      let patch = Int(components[2])
    {
      self.init(major: major, minor: minor, patch: patch)
    } else if components.count == 2,
      let major = Int(components[0]),
      let minor = Int(components[1])
    {
      self.init(major: major, minor: minor, patch: 0)
    } else {
      return nil
    }
  }
}

// MARK: - Comparable

extension SemanticVersion: Comparable {
  public static func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    if lhs.major != rhs.major {
      return lhs.major < rhs.major
    } else if lhs.minor != rhs.minor {
      return lhs.minor < rhs.minor
    } else if lhs.patch != rhs.patch {
      return lhs.patch < rhs.patch
    } else {
      return false
    }
  }
}

// MARK: - CustomStringConvertible

extension SemanticVersion: CustomStringConvertible {
  public var description: String {
    "\(major).\(minor).\(patch)"
  }
}

// MARK: - CustomDebugStringConvertible

extension SemanticVersion: CustomDebugStringConvertible {
  public var debugDescription: String {
    "SemanticVersion(major: \(major), minor: \(minor), patch: \(patch))"
  }
}

// MARK: - ExpressibleByStringLiteral

extension SemanticVersion: ExpressibleByStringLiteral {
  public init(stringLiteral value: StringLiteralType) {
    guard let version = SemanticVersion(string: value) else {
      assertionFailure("無効なセマンティックバージョン文字列です: \(value)")
      self = SemanticVersion(major: 0, minor: 0, patch: 0)
      return
    }
    self = version
  }
}
