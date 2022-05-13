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
    
    @State private var boughtListCoin: BoughtListCoin
    @State private var coinQuantity = 0.0
    @State private var coinPrice = 0.0
    
    //var interector: CoinSelectedInformationLogic?
    
    init(coinName: String, coinValue: Double){
        self.coinName = coinName
        self.coinValue = coinValue
        self.boughtListCoin = BoughtListCoin()
    }
    
    var body: some View {
        NavigationView{
            VStack{
                Text(String(coinValue))
                    .font(.title)
                Spacer()
                HStack{
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
                        let newCoin = InformationBoughtCoin(name: coinName, value: coinPrice, quantity: coinQuantity)
                        boughtListCoin.listOfBoughtCoin.append(newCoin)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color.blue)
                    }
                    .padding()
                }
                
                List {
                    ForEach(boughtListCoin.listOfBoughtCoin) { coin in
                        HStack {
                            Text(String(coin.quantity))
                            Text(String(coin.value))
                        }
                    }
                }
                
            }
        }.navigationBarTitle(coinName)
    }
}
