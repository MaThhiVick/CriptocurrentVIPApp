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

struct ViewGetCoinInformation: View {
    var interector: GetCoinInformationLogic?
    
    var body: some View {
        NavigationView{
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.onAppear{
            fetchCoinData()
        }
    }
}

extension ViewGetCoinInformation: GetCoinInformationDisplayLogic {
    func displayCoinData(viewModel: CreateCoin.LoadCoin.ViewModel) {
        print(viewModel)
    }
    
    func fetchCoinData() {
        let request = CreateCoin.LoadCoin.Request()
        interector?.loadCryptoCoins(request: request)
    }
}

struct GetCoinInformationView_Previews: PreviewProvider {
    static var previews: some View {
        ViewGetCoinInformation()
    }
}
