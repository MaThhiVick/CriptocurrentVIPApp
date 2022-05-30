//
//  Worker.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 10/05/22.
//

import Foundation

class SaveLoadCoinWorker {
    private let defaults = UserDefaults.standard

    func save(coin: InformationBoughtCoin) {
        var listOfCoin = load()
        listOfCoin.append(coin)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(listOfCoin) {
            defaults.set(encoded, forKey: "ListOfCoinsBought")

        }
    }
    
    func load() -> [InformationBoughtCoin] {
        var valueReturn: [InformationBoughtCoin]?
        if let listOfCoinsBought = defaults.object(forKey: "ListOfCoinsBought") as? Data {
            let decoder = JSONDecoder()
            if let coinList = try? decoder.decode([InformationBoughtCoin].self, from: listOfCoinsBought) {
                valueReturn = coinList
            }
        }
        
        if let valueReturn = valueReturn {
            return valueReturn
        } else {
            return []
        }
    }
}
