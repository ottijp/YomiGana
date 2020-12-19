public extension String {
  /// 文字ごとの読み仮名に変換する
  /// - Parameters:
  ///   - charset: 印字・表示される文字形状を特定する文字セット
  ///   - separator: 読み仮名文字列を区切るセパレータ
  /// - Returns: セパレータで区切られた，文字ごとの読み仮名文字列
  func toYomiGana(charset: YomiGanaCharset = .ascii, separator: String = "・") -> String {
    // 読み仮名ディクショナリ
    let dict: [Character:String]
    switch charset {
    case .ascii:
      dict = kanaDict
    case .jisx0201:
      // JIS X 0201は字体の異なる文字が含まれるため，差分を合成する
      dict = kanaDict.merging(kanaDictJisDiff, uniquingKeysWith: { (_, new) in new })
    }
    
    return self.map({ c in dict[c] ?? String(c) }).joined(separator: separator)
  }
}

/// 文字セット
public enum YomiGanaCharset {
  /// ASCII
  case ascii
  /// JIS X 0201
  case jisx0201
}

let kanaDict: [Character:String] = [
  " ": "空白",
  "!": "感嘆符",
  "\"": "ダブルクォート",
  "#": "シャープ",
  "$": "ドルマーク",
  "%": "パーセント",
  "&": "アンド",
  "'": "シングルクォート",
  "(": "左丸括弧",
  ")": "右丸括弧",
  "*": "アスタリスク",
  "+": "プラス",
  ",": "コンマ",
  "-": "ハイフン",
  ".": "ドット",
  "/": "スラッシュ",
  "0": "ゼロ",
  "1": "イチ",
  "2": "ニ",
  "3": "サン",
  "4": "ヨン",
  "5": "ゴ",
  "6": "ロク",
  "7": "ナナ",
  "8": "ハチ",
  "9": "キュウ",
  ":": "コロン",
  ";": "セミコロン",
  "<": "左山形括弧",
  "=": "イコール",
  ">": "右山形括弧",
  "?": "疑問符",
  "@": "アットマーク",
  "A": "エー（大文字）",
  "B": "ビー（大文字）",
  "C": "シー（大文字）",
  "D": "ディー（大文字）",
  "E": "イー（大文字）",
  "F": "エフ（大文字）",
  "G": "ジー（大文字）",
  "H": "エイチ（大文字）",
  "I": "アイ（大文字）",
  "J": "ジェー（大文字）",
  "K": "ケイ（大文字）",
  "L": "エル（大文字）",
  "M": "エム（大文字）",
  "N": "エヌ（大文字）",
  "O": "オー（大文字）",
  "P": "ピー（大文字）",
  "Q": "キュー（大文字）",
  "R": "アール（大文字）",
  "S": "エス（大文字）",
  "T": "ティー（大文字）",
  "U": "ユー（大文字）",
  "V": "ブイ（大文字）",
  "W": "ダブリュー（大文字）",
  "X": "エックス（大文字）",
  "Y": "ワイ（大文字）",
  "Z": "ゼット（大文字）",
  "[": "左角括弧",
  "\\": "バックスラッシュ",
  "]": "右角括弧",
  "^": "キャロット",
  "_": "アンダースコア",
  "`": "バッククォート",
  "a": "エー",
  "b": "ビー",
  "c": "シー",
  "d": "ディー",
  "e": "イー",
  "f": "エフ",
  "g": "ジー",
  "h": "エイチ",
  "i": "アイ",
  "j": "ジェー",
  "k": "ケイ",
  "l": "エル",
  "m": "エム",
  "n": "エヌ",
  "o": "オー",
  "p": "ピー",
  "q": "キュー",
  "r": "アール",
  "s": "エス",
  "t": "ティー",
  "u": "ユー",
  "v": "ブイ",
  "w": "ダブリュー",
  "x": "エックス",
  "y": "ワイ",
  "z": "ゼット",
  "{": "左中括弧",
  "|": "縦線",
  "}": "右中括弧",
  "~": "チルダ",
]

let kanaDictJisDiff: [Character:String] = [
  "\\": "円マーク",
  "~": "オーバーライン",
]