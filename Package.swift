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
            name: "RTCCommon",
            url: "https://sdk-liteav-1252463788.cos.ap-hongkong.myqcloud.com/app/tuikit/download/release/3.1/RTCCommon-1.3.0.zip",
            checksum: "34a54148ed3c7b97185c5ab3b90676eff38c4b2a4f54fdd39dd3cb53e94ca9e3"
        ),
        .binaryTarget(
            name: "RTCRoomEngine",
            url: "https://liteav.sdk.qcloud.com/app/tuikit/download/customer/zhenxin/RTCRoomEngine.xcframework.zip",
            checksum: "094f773e4b6b757908d8d53c30d27a64cefb06a03a14e094b34d3eb5aabc72ce"
        ),
        .target(
            name: "RoomEngine",
            dependencies: [
                .target(name: "RTCCommon"),
                .target(name: "RTCRoomEngine"),
                .product(name: "Professional_SwiftPM", package: "Professional_swiftpm"),
                .product(name: "TXLiteAVSDK_ReplayKit", package: "professional_swiftpm"), 
                .product(name: "Chat_SDK_SwiftPM", package: "chat_sdk_swiftpm")
            ],
            sources: ["RoomEngine.swift"]
        )
    ]
)
