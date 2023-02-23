//
//  Worker.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 10/05/22.
//

import Foundation

protocol MemoryManagerProtocol {
    func save(coin: InformationBoughtCoin)
    func load() -> [InformationBoughtCoin]
    func saveNewList(newList: [InformationBoughtCoin])
}

class SaveLoadCoinWorker: MemoryManagerProtocol {
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
    
    func saveNewList(newList: [InformationBoughtCoin]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(newList) {
            defaults.set(encoded, forKey: "ListOfCoinsBought")
        }
    }
}
