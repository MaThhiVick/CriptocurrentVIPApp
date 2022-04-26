//
//  ConfiguratorGetCoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 26/04/22.
//

import SwiftUI

extension ViewGetCoinInformation {
    func configureView() -> some View {
        var view = self
        let interector = InterectorGetCoinInformation()
        let presenter = PresenterGetCoinInformation()
        view.interector = interector
        interector.presenter = presenter
        presenter.view = view
        
        return view
    }
}
