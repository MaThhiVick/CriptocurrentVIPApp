//
//  CoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 05/05/22.
//

import SwiftUI

//protocol CoinSelectedDiplayLogic {
//    func displayCoinData(viewModel: CoinSelected.LoadCoin.Request)
//}
//
//extension ViewCoinInformation: CoinSelectedDiplayLogic {
//    func displayCoinData(viewModel: CoinSelected.LoadCoin.Request) {
//    }
//}

struct ViewCoinInformation: View {
    var coinName: String
    var coinValue: Double
    //var interector: CoinSelectedInformationLogic?
    
    var body: some View {
        navigationTitle(Text(coinName))
        Text("\(coinName)")
    }
}
