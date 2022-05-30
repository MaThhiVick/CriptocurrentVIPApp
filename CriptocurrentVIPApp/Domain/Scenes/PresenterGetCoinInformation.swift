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
        
        let coinList = response.coinData
                
        let viewModel = CreateCoin.LoadCoin.ViewModel(
        coinList: coinList)
        
        
        DispatchQueue.main.async {
            self.view?.displayCoinData(viewModel: viewModel)
        }
    }
}
