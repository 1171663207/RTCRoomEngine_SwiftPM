// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "RoomEngine",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "RoomEngine",
            targets: ["RoomEngine"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Tencent-RTC/Professional_SwiftPM", from: "12.5.0"),
        .package(url: "https://github.com/Tencent-RTC/Chat_SDK_SwiftPM.git", from: "8.3.6498")
    ],
    targets: [
        .binaryTarget(
            name: "RTCRoomEngine",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/customer/zhenxin/RTCRoomEngine.xcframework.zip",
            checksum: "094f773e4b6b757908d8d53c30d27a64cefb06a03a14e094b34d3eb5aabc72ce"
        ),
        .target(
            name: "RoomEngine",
            dependencies: [
                .target(name: "RTCRoomEngine"),
                .product(name: "Professional_SwiftPM", package: "Professional_swiftpm"),
                .product(name: "TXLiteAVSDK_ReplayKit", package: "professional_swiftpm"), 
                .product(name: "Chat_SDK_SwiftPM", package: "chat_sdk_swiftpm")
            ],
            sources: ["RoomEngine.swift"]
        )
    ]
)
