//
//  CoinListError.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 07/02/23.
//

import Foundation

enum CoinListError: LocalizedError, Equatable {
    case invalidURL
    case emptyData
    case decodeError
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid response model"
        case .emptyData:
            return "Data is empty"
        case .decodeError:
            return "An error occur during decode"
        case .failedRequest(let description):
            return description
        }
    }
}
