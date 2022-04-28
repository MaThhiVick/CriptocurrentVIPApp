//
//  ConfiguratorGetCoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 26/04/22.
//

import Foundation
protocol GetCoinInformationPresentation {
    func presentCoinData(response: CreateCoin.LoadCoin.Response)
}

class PresenterGetCoinInformation {
    var view: GetCoinInformationDisplayLogic?
}

extension PresenterGetCoinInformation: GetCoinInformationPresentation {
    func presentCoinData(response: CreateCoin.LoadCoin.Response) {
        
        let coinList = CoinList()
        for coin in response.coinData {
            let filtringCoin = Coin()
            filtringCoin.name = coin.slug
            filtringCoin.value = coin.metrics.marketData.priceUsd
            coinList.coinList.append(filtringCoin)
        }
        
        let viewModel = CreateCoin.LoadCoin.ViewModel(
        coinList: coinList)
        
        DispatchQueue.main.async {
            self.view?.displayCoinData(viewModel: viewModel)
        }
    
        
    }
}
