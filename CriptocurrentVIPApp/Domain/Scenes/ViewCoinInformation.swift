//
//  GetCoinInformationView.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 26/04/22.
//

import SwiftUI

protocol GetCoinInformationDisplayLogic {
    func displayCoinData(viewModel: CreateCoin.LoadCoin.ViewModel)
}

extension ViewGetCoinInformation: GetCoinInformationDisplayLogic {
    func displayCoinData(viewModel: CreateCoin.LoadCoin.ViewModel) {
        coinList.coinList = viewModel.coinList
        
    }
    
    func fetchCoinData() {
        let request = CreateCoin.LoadCoin.Request()
        interector?.loadCryptoCoins(request: request)
    }
}

struct ViewGetCoinInformation: View {
    @ObservedObject var coinList = CoinList()
    var interector: GetCoinInformationLogic?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(coinList.coinList, id: \.name) {
                        coin in
                        HStack {
                            Text(coin.name)
                            Spacer()
                            NavigationLink("$\(coin.value, specifier: "%.2f")", destination: ViewCoinInformation(coinName: coin.name, coinValue: coin.value).configureView())
                                .accessibilityIdentifier(coin.name)
                        }
                    }
                }
            }.navigationTitle("Crypto Coins")
        }.onAppear {
            fetchCoinData()
        }
    }
}

struct GetCoinInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ViewGetCoinInformation()
    }
}
