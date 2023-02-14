//
//  ConfiguratorGetCoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 26/04/22.
//

import Foundation
protocol GetCoinInformationLogic {
    func loadCryptoCoins(request: CreateCoin.LoadCoin.Request) -> CoinListError?
}

class InteractorGetCoinInformation {
    var presenter: GetCoinInformationPresentation?
    var worker: RequestCoinProtocol
    var coinListData: CoinList?
    
    init(presenter: GetCoinInformationPresentation? = nil,
         worker: RequestCoinProtocol,
         coinListData: CoinList? = nil) {
        self.presenter = presenter
        self.worker = worker
        self.coinListData = coinListData
    }
}

extension InteractorGetCoinInformation: GetCoinInformationLogic {
    func loadCryptoCoins(request: CreateCoin.LoadCoin.Request) -> CoinListError? {
        var errorValue: CoinListError?
        
        worker.fetchRequest { [weak self] data, error in
            if error != nil {
                errorValue = CoinListError.requestReturnedError
                return
            }
            
            self?.coinListData = CoinList()
            
            if let data = data {
                for criptocoinElement in data {
                    let coin = Coin()
                    coin.name = criptocoinElement.name ?? "errorName"
                    coin.value = criptocoinElement.current_price ?? 0.0
                    self?.coinListData?.coinList.append(coin)
                }
            }
        
            guard let coinList = self?.coinListData?.coinList else {
                errorValue = CoinListError.coinIsNil
                return
            }
                    
            let response = CreateCoin.LoadCoin.Response(coinData: coinList)

            self?.presenter?.presentCoinData(response: response)
        }
        return errorValue
    }
}
