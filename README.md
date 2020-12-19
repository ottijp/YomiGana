# YomiGana

アルファベット・数字・記号のそれぞれの文字を読み仮名に変換するSwiftライブラリです．

## インストール

### Swift Package Manager

Package.swift に追記することで，インストールできます．

```
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/ottijp/YomiGana.git", from: "1.0.0")
    ]
)
```

もしくはXcodeの File メニューから Swift Packages > Add Package Dependency... を選択してください．

## 使い方

ライブラリをインポートすることで， Stringの拡張関数 `toYomiGana()` を利用できるようになります．

```
import YomiGana

let yomigana = "xyz!123".toYomiGana()
print(yomigana)
// エックス・ワイ・ゼット・感嘆符・イチ・ニ・サン
```

読み仮名のセパレータを指定する場合は `separetor` パラメタをセットします．
また，JIS X 0201の文字セット（バックスラッシュではなく円マークの表示・印字を想定している場合）は，`charset`パラメタに`.jisx0201`をセットします．

```
import YomiGana

let yomigana = "xyz\123".toYomiGana(charset: .jisx0201, separator: "　")
print(yomigana)
// エックス　ワイ　ゼット　円マーク　イチ　ニ　サン
```

## 対応範囲

[asciiコード](https://ja.wikipedia.org/wiki/ASCII)の印字可能文字に対応しています．
また，一部文字（円マークとオーバーライン）がasciiと異なるJIS X 0201に対応しています．
対応範囲外の文字は読み仮名ではなく，元の文字がそのまま出力されます．

## ライセンス

MIT
