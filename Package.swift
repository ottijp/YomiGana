// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "YomiGana",
  products: [
    .library(name: "YomiGana", targets: ["YomiGana"]),
  ],
  dependencies: [],
  targets: [
    .target( name: "YomiGana", dependencies: []),
    .testTarget( name: "YomiGanaTests", dependencies: ["YomiGana"]),
  ]
)
