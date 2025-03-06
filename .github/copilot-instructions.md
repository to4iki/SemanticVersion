# AI Coding
AIを駆使してコードを書く際の使い方についてまとめたドキュメントです。
人間が読む以外に、コーディングエージェントがプロンプトとして読むことを想定しています。

## SemanticVersion とは
このライブラリは、[SemVer 2.0.0](https://semver.org/lang/ja/) の仕様に従ったSwift実装です。
ビルドメタデータ、プレリリースバージョンには対応していない軽量実装となります。

## 基本条件
- 日本語で返信すること
- コード生成を求められた場合は、変更部分のみをわかりやすく説明し、提示すること
- 与えられた情報から問題や課題などを特定できない場合は、必要と思われるソースコードやファイルをユーザに聞き返すようにすること。足りない情報から推測して回答するのは極力避けること。
- また、質問者の発言が本当に正しいかを吟味し、常に自分で考えた回答するように心がけること
- 必要に応じて新規ファイルを作成すること
- コードの修正を行った場合には、修正後にプロジェクトがビルドできることを確認すること

## ディレクトリ配置規則
```
Sources/*         # アプリケーション
Tests/*           # テスト
.editorconfig     # エディタ設定
```

## コマンド
- Build: `swift build`
- Test all: `swift test --parallel`
- Test single: `swift test --filter "SemanticVersionTests.<TestClass>/<testMethod>"`
- Lint: `swift format lint -r Sources Tests`
- Format code: `swift format -r Sources Tests -i`
- Generate Xcode project: `swift package generate-xcodeproj`

## コーディング基本方針
- 最初に型と、それを処理する関数のインターフェースを考える
- コードのコメントとして、そのファイルがどういう仕様化を可能な限り明記する
- 継承よりコンポジションを優先する
- 関連する関数では引数の順序を一貫させる

## iOS/Swift
iOS/Swiftでのコーディングにおける一般的なベストプラクティスをまとめます。

### 方針
- UIコンポーネントにはSwiftUIを利用する
- 命名規則：Swift API Design GuidelinesSwit Standard Libraryの命名規則に従う
- 参照型ではなく値型を積極的に活用する
- 名前空間にはenumを利用する
- Option型に対してのForcedUnwrappingの利用は控える
- guardによる早期リターンを積極的に活用する
- 値型（structとenum）のエンティティは、Sendable、Equatableに準拠する

### 実装パターン
1. 関数ベース（状態を持たない場合）
  ```swift
  enum Logger {
    static func debug(_ text: String) {
      print(text)
    }
  }
  ```

## Testing
テストコードについてまとめます。

### 方針
- テストファイルは実装ファイルの構造と一致させる
- カバレッジを意識しすぎずに、最低限の項目を網羅する
- ユニットテストにはSwift Testingを仕様する
- テストデータの入力には、@Test(arguments:)を積極的に活用する
- 文脈毎に@Suiteでテスト関数をまとめること

## Gitワークフロー
コミットとプルリクエストの作成に関するベストプラクティスを説明します。

### コミットの作成
コミットを作成する際は、以下の手順に従います

1. 変更の確認
   ```bash
   # 未追跡ファイルと変更の確認
   git status

   # 変更内容の詳細確認
   git diff

   # コミットメッセージのスタイル確認
   git log
   ```

2. 変更の分析
   - 変更または追加されたファイルの特定
   - 変更の性質（新機能、バグ修正、リファクタリングなど）の把握
   - プロジェクトへの影響評価
   - 機密情報の有無確認

3. コミットメッセージの作成
   - 「なぜ」に焦点を当てる
   - 明確で簡潔な言葉を使用
   - 変更の目的を正確に反映
   - 一般的な表現を避ける

4. コミットの実行
   ```bash
   # 関連ファイルのみをステージング
   git add <files>

   # コミットメッセージの作成（HEREDOCを使用）
   git commit -m "xxx"
   ```
