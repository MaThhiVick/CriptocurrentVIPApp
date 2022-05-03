//
//  ConfiguratorGetCoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 26/04/22.
//NomicsAPI

import Foundation
protocol GetCoinInformationLogic {
    func loadCryptoCoins(request: CreateCoin.LoadCoin.Request)
}

class InterectorGetCoinInformation {
    var presenter: GetCoinInformationPresentation?
    var worker: CreateOrderWorker!
    var coinListData: CoinList?
}

extension InterectorGetCoinInformation: GetCoinInformationLogic {
    
    func loadCryptoCoins(request: CreateCoin.LoadCoin.Request) {
        worker = CreateOrderWorker()
        coinListData = CoinList()
        
        worker.fetchRepos { data in
            if let data = data {
                for criptocoinElement in data {
                    let coin = Coin()
                    coin.name = criptocoinElement.name ?? "errorName"
                    coin.value = criptocoinElement.current_price ?? 0.0
                    self.coinListData?.coinList.append(coin)
                }
            }
            
            guard let coinList = self.coinListData?.coinList as? [Coin] else {
                print("casting error")
                return
            }
           
            let response = CreateCoin.LoadCoin.Response(coinData: coinList)

            self.presenter?.presentCoinData(response: response)
        }
    }
}
