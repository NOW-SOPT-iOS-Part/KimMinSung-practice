//
//  _4th_SOPT_iOS_DanggeunCloneCodingUITestsLaunchTests.swift
//  34th-SOPT-iOS-DanggeunCloneCodingUITests
//
//  Created by 김민성 on 2024/04/19.
//

import XCTest

final class _4th_SOPT_iOS_DanggeunCloneCodingUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
