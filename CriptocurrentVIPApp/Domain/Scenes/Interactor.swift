
import Foundation
protocol CoinSelectedInformationLogic {
    func saveCoinBought(request:
                         CoinSelected.SaveCoin.Request)
    func loadCoinBought(request: CoinSelected.LoadCoin.Request)
}

class InterectorCoinSelectedInformation {
    var presenter: CoinSelectedPresentation?
    var worker: SaveLoadCoinWorker!
}

extension InterectorCoinSelectedInformation: CoinSelectedInformationLogic {
    
    func saveCoinBought(request: CoinSelected.SaveCoin.Request) {
        worker = SaveLoadCoinWorker()
        
        worker.save(coin: request.coinBought)
    }
    
    func loadCoinBought(request: CoinSelected.LoadCoin.Request) {
        worker = SaveLoadCoinWorker()
        
        let response = CoinSelected.LoadCoin.Response.init(coinLoaded: worker.load())
        self.presenter?.presentCoin(response: response)
        
        
    }
}
