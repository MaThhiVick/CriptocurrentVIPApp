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
        app.launchArguments += ["UI-Testing"]
        app.launch()
    }

    override func tearDownWithError() throws {
        app.launchArguments.removeAll()
        super.tearDown()
    }

    func testIfNavigationTitleExist() throws {
        XCTAssert(contentView.titleCoinList.exists, "The UIElement doesn't exist")
    }
    
    func testNavigation_FirstCoinSelectedAndReturnToInitial() throws {
        // Select the first coin
        app.collectionViews.cells.buttons["Bitcoin"].tap()
        // Other way to tap bitcoin cell:
        // app.collectionViews.cells.element(boundBy: 0).tap()
        
        // Tap the button back
        app.navigationBars.buttons.element(boundBy: 0).tap()
        
        XCTAssert(app.staticTexts["Crypto Coins"].exists, "An error occured and the Title of views doesn't exist")
    }
    
    func testInteraction_BuyACoin() throws {
        // Select the first coin
        app.collectionViews.cells.buttons["Bitcoin"].tap()
        
        let coinQuantityTextField = app.textFields["Coin Quantity"]
        let priceTextField = app.textFields["Price"]
        
        // Add quantity of coin bought
        coinQuantityTextField.tap()
        coinQuantityTextField.typeText("1")
        
        // Add price of coin
        priceTextField.tap()
        priceTextField.typeText("2000000")
        
        // Finish action adding information
        app.buttons["Add"].tap()
        
        XCTAssert(app.collectionViews.cells.element(boundBy: 0).staticTexts["1.0"].exists, "Quantity of coin doesn't exist or doesn't match with number previusly given")
        // Precisa ver pq essa caralha adiciona apenas 200 e não 20000
        XCTAssert(app.collectionViews.cells.element(boundBy: 0).staticTexts["20000.0"].exists, "Price of coin doesn't exist or doesn't match with number previusly given")
    }
}
