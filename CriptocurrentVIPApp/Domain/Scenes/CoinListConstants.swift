//
//  CoinListConstants.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 07/02/23.
//

import Foundation

struct CoinListConstants {
    static let authorizedResponse = 200
    static let requestCoinsURLString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
}
