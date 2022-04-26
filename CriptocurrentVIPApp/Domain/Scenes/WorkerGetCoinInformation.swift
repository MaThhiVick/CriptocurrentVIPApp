//
//  ConfiguratorGetCoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 26/04/22.
//

import Foundation
class CreateOrderWorker {
    func fetchRepos(completionHandler: (@escaping (Criptocurrent?) -> Void)) -> Void{
        
        let session = URLSession.shared
        let urlString = "https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            // First unwrap the optional data
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode(Criptocurrent.self, from: data)
                    completionHandler(responseObject)
                } catch {
                    completionHandler(nil)
                }
            }
        }
        
        task.resume()
    }
    
}
