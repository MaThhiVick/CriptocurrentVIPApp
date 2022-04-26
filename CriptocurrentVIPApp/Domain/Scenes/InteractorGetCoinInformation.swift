//
//  ConfiguratorGetCoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 26/04/22.
//

import Foundation
protocol GetCoinInformationLogic {
    func loadCryptoCoins(request: CreateCoin.LoadCoin.Request)
}

class InterectorGetCoinInformation {
    var presenter: GetCoinInformationPresentation?
    var worker: CreateOrderWorker!
    var coinsData: Criptocurrent?
}

extension InterectorGetCoinInformation: GetCoinInformationLogic {
    
    func loadCryptoCoins(request: CreateCoin.LoadCoin.Request) {
        worker = CreateOrderWorker()
        worker.fetchRepos { data in
            self.coinsData = data
            print(data ?? "Nao achei nenhum valor aque, vc esta lokao")
        }
        let response = CreateCoin.LoadCoin.Response(coinData: coinsData!)
        presenter?.presentCoinData(response: response)
    }
}
