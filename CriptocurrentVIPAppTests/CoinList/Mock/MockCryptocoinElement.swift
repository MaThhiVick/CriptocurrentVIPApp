//
//  MockCryptocoinElement.swift
//  CriptocurrentVIPAppTests
//
//  Created by Matheus Vicente on 09/02/23.
//

import Foundation
@testable import CriptocurrentVIPApp

let mockCryptocoinElement = CryptocoinElement(
    id: "1",
    symbol: "BTC",
    name: "Bitcoin",
    image: "https://www.example.com/btc.png",
    current_price: 80000.0,
    marketCap: 2000000000,
    marketCapRank: 1,
    fullyDilutedValuation: 3000000000,
    totalVolume: 500000000.0,
    high24H: 81000.0,
    low24H: 79000.0,
    priceChange24H: 1000.0,
    priceChangePercentage24H: 0.0125,
    marketCapChange24H: 200000000,
    marketCapChangePercentage24H: 0.01,
    circulatingSupply: 21000000.0,
    totalSupply: 21000000.0,
    maxSupply: 21000000.0,
    ath: 100000.0,
    athChangePercentage: -0.2,
    athDate: "2022-01-01",
    atl: 70000.0,
    atlChangePercentage: 0.1,
    atlDate: "2022-12-01",
    roi: Roi(
        times: 2.0,
        currency: .btc,
        percentage: 200.0
    ),
    lastUpdated: "2022-12-31"
)

