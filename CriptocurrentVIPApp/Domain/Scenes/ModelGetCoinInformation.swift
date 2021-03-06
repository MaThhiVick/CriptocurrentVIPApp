//
//  ConfiguratorGetCoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 26/04/22.
//

import Foundation
enum CreateCoin {
    enum LoadCoin {
        struct Request {}
        
        struct Response {
            var coinData: [Coin]
        }
        
        struct ViewModel {
            var coinList: [Coin]
        }
    }
}
