//
//  BuyedListCoin.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 12/05/22.
//

import SwiftUI

class BoughtListCoin: ObservableObject {
    @Published var listOfBoughtCoin = [InformationBoughtCoin]()
}
