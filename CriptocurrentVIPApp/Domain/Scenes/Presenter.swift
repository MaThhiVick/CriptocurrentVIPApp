//
//  Presenter.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 10/05/22.
//

import Foundation
protocol CoinSelectedPresentation {
    func presentCoin(response:
                     CoinSelected.LoadCoin.Response)
}

class PresenterCoinSelected {
    var view: CoinSelectedDiplayLogic?
}

extension PresenterCoinSelected: CoinSelectedPresentation {
    
    func presentCoin(response: CoinSelected.LoadCoin.Response) {
        
        let viewModel = CoinSelected.LoadCoin.ViewModel.init(coinBought: response.coinListLoaded.reversed())
        self.view?.displayCoinData(viewModel: viewModel)
    }
}
