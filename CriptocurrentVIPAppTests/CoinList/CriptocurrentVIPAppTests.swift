//
//  CriptocurrentVIPAppTests.swift
//  CriptocurrentVIPAppTests
//
//  Created by Matheus Vicente on 12/01/23.
//

import XCTest
@testable import CriptocurrentVIPApp

class RequestWorkerTests: XCTestCase {
    var sut: RequestWorker!
    
    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = RequestWorker(urlSession: urlSession, urlString: CoinListConstants.requestCoinsURLString)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        MockURLProtocol.stubResponseData = nil
        MockURLProtocol.error = nil
    }
    
    func testFetchRequest_WhenGivenSuccessfullResponse_ReturnsSuccess() {
        // Given
        let responseCoin = "[{\"symbol\":\"btc\",\"atl\":67.810000000000002,\"id\":\"bitcoin\",\"current_price\":22811,\"ath\":69045,\"image\":\"https:\\/\\/assets.coingecko.com\\/coins\\/images\\/1\\/large\\/bitcoin.png?1547033579\",\"name\":\"Bitcoin\"},{\"symbol\":\"eth\",\"atl\":0.432979,\"id\":\"ethereum\",\"current_price\":1642.55,\"ath\":4878.2600000000002,\"image\":\"https:\\/\\/assets.coingecko.com\\/coins\\/images\\/279\\/large\\/ethereum.png?1595348880\",\"roi\":{\"times\":95.194555759690516,\"currency\":\"btc\",\"percentage\":9519.4555759690502},\"name\":\"Ethereum\"}]"
        
        MockURLProtocol.stubResponseData = responseCoin.data(using: .utf8)
        
        let expectation = self.expectation(description: "Request criptocurrent information")
        
        // When
        sut.fetchRequest { coins, _ in
            
            // Then
            XCTAssertNotNil(coins?[0], "The fetchRequest method did not return an object")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 5)
    }
    
    func testFetchRequest_WhenDataCantBeDecoded_ReturnsError() {
        // Given
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "A failed Request expectation")
        
        // When
        sut.fetchRequest { coin, error in
            
            // Then
            XCTAssertNil(coin, "The response model for a request containing unknow JSON response, shoud have been nil")
            XCTAssertEqual(error, CoinListError.decodeError, "The fetchRequest() method did not return expected error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testFetchRequest_WhenDataIsEmpty_ReturnsError() {
        // Given
        MockURLProtocol.stubResponseData = nil
            
        let expectation = self.expectation(description: "A failed request expectation with nil data")
        
        // When
        sut.fetchRequest { coin, error in
            
            // Then
            XCTAssertNil(coin, "The response model for a request containing unknow JSON response, shoud have been nil")
            XCTAssertEqual(error, CoinListError.decodeError)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
        
    }
    
    func testFetchRequest_WhenErrorIsReceived_ReturnsError() {
        // Given
        let errorDescription = "The operation couldn’t be completed. (CriptocurrentVIPApp.CoinListError error 0.)"
        MockURLProtocol.error = CoinListError.failedRequest(description: errorDescription)
        
        let expectation = self.expectation(description: "A failed Request expectation")
        
        // When
        sut.fetchRequest { coin, error in
            
            // Then
            XCTAssertEqual(error, CoinListError.failedRequest(description: errorDescription),"The fetchRequest() method did not return an expecter error for failed request")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testFetchRequest_WhenAnEmptyURLIsInsert_ReturnsError() {
        // Given
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let sut = RequestWorker(urlSession: urlSession, urlString: "")
        
        MockURLProtocol.error = CoinListError.invalidURL
        
        let expectation = self.expectation(description: "A empty URL is insert")
        
        // When
        sut.fetchRequest { coin, error in
            
            // Then
            XCTAssertEqual(error, CoinListError.invalidURL, "The signup() method did not return an expected error for an invalidRequestURLString error")
            XCTAssertNil(coin, "When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
}
