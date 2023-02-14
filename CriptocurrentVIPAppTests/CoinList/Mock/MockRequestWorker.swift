//
//  MockRequestWorker.swift
//  CriptocurrentVIPAppTests
//
//  Created by Matheus Vicente on 09/02/23.
//

import Foundation
@testable import CriptocurrentVIPApp

class MockRequestWorker: RequestCoinProtocol {
    
    var shouldReturnError: Bool
    let criptoList = [mockCryptocoinElement]
    
    init(shouldReturnError: Bool = false) {
        self.shouldReturnError = shouldReturnError
    }
    
    func fetchRequest(completionHandler: @escaping (Criptocoin?, CoinListError?) -> Void) {
        
        if shouldReturnError {
            completionHandler(nil, CoinListError.failedRequest(description: "Error to request coin list"))
        } else {
            completionHandler(criptoList, nil)
        }
    }
}
