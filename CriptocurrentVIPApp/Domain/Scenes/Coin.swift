//
//  Coin.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 28/04/22.
//

import Foundation

class Coin: ObservableObject {
    @Published var name: String = ""
    @Published var value: Double = 0.0
}

class CoinList: ObservableObject, Equatable{
    @Published var coinList: [Coin] = []
    
    static func == (lhs: CoinList, rhs: CoinList) -> Bool {
        true
    }
}
