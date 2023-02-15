//
//  ViewCoinInformationVisualElements.swift
//  CriptocurrentVIPAppUITests
//
//  Created by Matheus Vicente on 15/02/23.
//

import Foundation
import XCTest
@testable import CriptocurrentVIPApp

class ViewCoinInformationVisualElements {
    var app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var titleCoinList: XCUIElement {
        app.navigationBars["Crypto Coins"]
    }
}
