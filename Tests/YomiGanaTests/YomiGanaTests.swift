import XCTest
@testable import YomiGana

final class YomiGanaTests: XCTestCase {
  func testYomiGana() {
    XCTAssertEqual("hOg1E!\\".toYomiGana(), "エイチ・オー（大文字）・ジー・イチ・イー（大文字）・感嘆符・バックスラッシュ")
  }

  func testYomiGanaSeparator() {
    XCTAssertEqual("hO".toYomiGana(separator: "　"), "エイチ　オー（大文字）")
  }

  func testYomiGanaJis() {
    XCTAssertEqual("\\~".toYomiGana(charset: .jisx0201), "円マーク・オーバーライン")
  }

  func testYomiGanaNonAscii() {
    XCTAssertEqual("a文字b".toYomiGana(charset: .jisx0201), "エー・文・字・ビー")
  }
  
  static var allTests = [
      ("testYomiGana", testYomiGana),
      ("testYomiGanaSeparator", testYomiGanaSeparator),
      ("testYomiGanaJis", testYomiGanaJis),
      ("testYomiGanaAscii", testYomiGanaNonAscii),
  ]
}
