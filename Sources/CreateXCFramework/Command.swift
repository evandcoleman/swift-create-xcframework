//
//  Command.swift
//  swift-create-xcframework
//
//  Created by Rob Amos on 7/5/20.
//

import ArgumentParser
import CreateXCFrameworkKit
import Foundation

struct Command: ParsableCommand {

    // MARK: - Configuration

    static var configuration = CommandConfiguration (
        abstract: "Creates an XCFramework out of a Swift Package using xcodebuild",
        discussion:
            """
            Note that Swift Binary Frameworks (XCFramework) support is only available in Swift 5.1
            or newer, and so it is only supported by recent versions of Xcode and the *OS SDKs. Likewise,
            only Apple platforms are supported.

            Supported platforms: \(TargetPlatform.allCases.map({ $0.rawValue }).joined(separator: ", "))
            """,
        version: "2.3.0"
    )


    // MARK: - Arguments

    @OptionGroup()
    var options: Options


    // MARK: - Execution

    func run() throws {
        let builder = FrameworkBuilder(options: options)

        try builder.build()
    }
}
