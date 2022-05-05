//
//  CoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 05/05/22.
//

import SwiftUI

struct CoinInformation: View {
    var coinName: String
    var coinValue: Double
    
    var body: some View {
        navigationTitle(Text(coinName))
        Text(coinName)
    }
}
