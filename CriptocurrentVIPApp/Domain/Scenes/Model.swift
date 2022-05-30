//
//  Model.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 10/05/22.
//

import Foundation
enum CoinSelected {
    enum LoadCoin {
        struct Request {}
        
        struct Response {
            var coinLoaded: [InformationBoughtCoin]
        }
        
        struct ViewModel {
            var coinBought: [InformationBoughtCoin]
        }
    }
    
    enum SaveCoin {
        struct Request {
            var coinBought: InformationBoughtCoin
        }
        
        struct Response {}
        
        struct ViewModel{}
    }
}
