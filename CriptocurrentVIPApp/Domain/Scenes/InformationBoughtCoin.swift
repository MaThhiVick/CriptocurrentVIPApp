//
//  InformationBoughtCoin.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 13/05/22.
//

import Foundation

struct InformationBoughtCoin: Identifiable, Codable{
    var id = UUID()
    var name: String
    var value: Double
    var quantity: Double
}

class InformationBoughtCoinList: ObservableObject {
    @Published var coinBoughtList: [InformationBoughtCoin] = []
}
