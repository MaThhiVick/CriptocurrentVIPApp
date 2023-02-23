//
//  InterectorGetCoinInformation.swift
//  CriptocurrentVIPAppTests
//
//  Created by Matheus Vicente on 09/02/23.
//

import XCTest
@testable import CriptocurrentVIPApp

final class InteractorGetCoinInformationTests
: XCTestCase {
    var workerMock: MockRequestWorker!
    var testSubject: InteractorGetCoinInformation!

    override func setUpWithError() throws {
        workerMock = MockRequestWorker()
        testSubject = InteractorGetCoinInformation(worker: workerMock)
    }

    override func tearDownWithError() throws {
        workerMock = nil
        testSubject = nil
    }
    // TODO: Create a test for a case which receive data nil
    
    func testLoadCryptoCoins_WhenMethodReceiveDataSuccessfull_ReturnsSuccess() {
        // Given
        
        // When
        _ = testSubject.loadCryptoCoins(request: CreateCoin.LoadCoin.Request())
        
        // Then
        XCTAssertNotNil(testSubject.coinListData, "Method returned a nil value")
    }
    
    func testLoadCryptoCoins_WhenMethodReceiveError_ReturnsError() {
        // Given
        workerMock.shouldReturnError = true
        
        // When
        let error = testSubject.loadCryptoCoins(request: CreateCoin.LoadCoin.Request())
        
        // Then
        XCTAssertNil(testSubject.coinListData)
        XCTAssertEqual(error, CoinListError.requestReturnedError)
    }
    // TODO: Test user default, Save, load, delete all, delete one coin.
}
