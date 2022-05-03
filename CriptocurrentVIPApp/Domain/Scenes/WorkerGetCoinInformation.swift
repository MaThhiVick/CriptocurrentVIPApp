//
//  ConfiguratorGetCoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 26/04/22.
// coingeckoAPI

import Foundation
class CreateOrderWorker {
    func fetchRepos(completionHandler: (@escaping (Criptocoin?) -> Void)) -> Void {
        
        let session = URLSession.shared
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
        guard let url = URL(string: urlString) else {
            print("url request problems")
            return }
        let request = URLRequest(url: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            // First unwrap the optional data
            guard let data = data else {
                print("data not founded")
                return
            }
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode(Criptocoin.self, from: data)
                    completionHandler(responseObject)
                } catch {
                    print("information didn't found \(error)")
                    completionHandler(nil)
                }
            }
        }
        task.resume()
    }
}
