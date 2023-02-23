//
//  Configurator.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 10/05/22.
//

import SwiftUI

extension ViewCoinInformation {
    func configureView() -> some View {
        var view = self
        let interector = InterectorCoinSelectedInformation(worker: SaveLoadCoinWorker())
        let presenter = PresenterCoinSelected()
        view.interector = interector
        interector.presenter = presenter
        presenter.view = view
        
        return view
    }
}
