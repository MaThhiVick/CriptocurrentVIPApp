//
//  CoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 05/05/22.
//

import SwiftUI

protocol CoinSelectedDiplayLogic {
    func displayCoinData(viewModel: CoinSelected.LoadCoin.ViewModel)
}

extension ViewCoinInformation: CoinSelectedDiplayLogic {
    func displayCoinData(viewModel: CoinSelected.LoadCoin.ViewModel) {
        boughtListCoin.coinBoughtList = viewModel.coinBought
        
        print("printando a lista: ", boughtListCoin.coinBoughtList)
    }
    
    //to save the coin and send info for user default
    func saveCoin(dataCoin: InformationBoughtCoin) {
        let request = CoinSelected.SaveCoin.Request(coinBought: dataCoin)
        interector?.saveCoinBought(request: request)
    }
    
    func loadCoinBought() {
        let request = CoinSelected.LoadCoin.Request()
        interector?.loadCoinBought(request: request)
    }
}

struct ViewCoinInformation: View {
    var coinName: String
    var coinValue: Double
    
    @ObservedObject var boughtListCoin = InformationBoughtCoinList()
    @State private var coinQuantity = 0.0
    @State private var coinPrice = 0.0
    
    var interector: CoinSelectedInformationLogic?
    
    init(coinName: String, coinValue: Double){
        self.coinName = coinName
        self.coinValue = coinValue
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text(String(coinValue))
                    .font(.title)
                Spacer()
                HStack {
                    Text("Preco medio")
                    Text("Colocar quanto esta o preco médio")
                }
                Spacer()
                HStack {
                    TextField("Coin Quantity", value: $coinQuantity, format: .number)
                        .keyboardType(.decimalPad)
                        .padding()
                    
                    TextField("Price", value: $coinPrice, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Button {
                        //TODO: if input is 0 in both or in one of them, the save can't work
                        let newCoin = InformationBoughtCoin(name: coinName, value: coinPrice, quantity: coinQuantity)
                        saveCoin(dataCoin: newCoin)
                        loadCoinBought()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color.blue)
                    }
                    .padding()
                }
                List {
                    ForEach(boughtListCoin.coinBoughtList) { coin in
                        HStack {
                            Text(String(coin.quantity))
                            Text(String(coin.value))
                        }
                    }
                }
                
            }
        }.navigationBarTitle(coinName)
            .onAppear {
                loadCoinBought()
            }
    }
}
