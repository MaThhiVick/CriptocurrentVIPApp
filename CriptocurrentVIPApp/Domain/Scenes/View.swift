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
    }
    
    func saveCoin(dataCoin: InformationBoughtCoin) {
        let request = CoinSelected.SaveCoin.Request(coinBought: dataCoin)
        interector?.saveCoinBought(request: request)
    }
    
    func loadCoinBought() {
        let request = CoinSelected.LoadCoin.Request()
        interector?.loadCoinBought(request: request)
    }
    
    func newListCoin(newCoinList: [InformationBoughtCoin]) {
        let request = CoinSelected.DeleteCoin.Request(newListCoin: newCoinList)
        interector?.newCoinList(request: request)
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
                        if coinPrice != 0 && coinQuantity != 0 {
                            let newCoin = InformationBoughtCoin(name: coinName, value: coinPrice, quantity: coinQuantity)
                            saveCoin(dataCoin: newCoin)
                            loadCoinBought()
                        }
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color.blue)
                    }
                    .padding()
                }
                List {
                    ForEach(boughtListCoin.coinBoughtList.filter {
                        $0.name == coinName
                        //TODO: make this filter happining in presenter
                    }) { coin in
                        HStack {
                            Text(String(coin.quantity))
                            Text(String(coin.value))
                        }
                    }
                    .onDelete(perform: self.deleteItem(at:))
                }
                
            }
        }.navigationBarTitle(coinName)
            .onAppear {
                loadCoinBought()
            }
    }
    
    private func deleteItem(at indexSet: IndexSet) {
        self.boughtListCoin.coinBoughtList.remove(atOffsets: indexSet)
        newListCoin(newCoinList: boughtListCoin.coinBoughtList.reversed())
      }
}
