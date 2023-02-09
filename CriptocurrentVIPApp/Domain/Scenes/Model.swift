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
            var coinListLoaded: [InformationBoughtCoin]
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
    
    enum DeleteCoin {
        struct Request {
            var newListCoin: [InformationBoughtCoin]
        }
        
        struct Response {}
        
        struct ViewModel{}
    }

    
}
