//
//  CriptocurrentVIPAppUITests.swift
//  CriptocurrentVIPAppUITests
//
//  Created by Matheus Vicente on 14/02/23.
//

import XCTest

final class CriptocurrentVIPAppUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private var contentView: ViewCoinInformationVisualElements!

    override func setUpWithError() throws {
        app = XCUIApplication()
        contentView = ViewCoinInformationVisualElements(app: app)

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func testIfNavigationTitleExist() throws {
        XCTAssert(contentView.titleCoinList.exists, "The UIElement doesn't exist")
    }
}
