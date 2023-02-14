//
//  ConfiguratorGetCoinInformation.swift
//  CriptocurrentVIPApp
//
//  Created by Matheus Vicente on 26/04/22.
// coingeckoAPI

import Foundation
protocol RequestCoinProtocol {
    func fetchRequest(completionHandler: @escaping (Criptocoin?, CoinListError?) -> Void)
}

class RequestWorker: RequestCoinProtocol {
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlSession: URLSession = .shared, urlString: String = CoinListConstants.requestCoinsURLString) {
        self.urlSession = urlSession
        self.urlString = urlString
    }
    
    func fetchRequest(completionHandler: @escaping (Criptocoin?, CoinListError?) -> Void) {
        guard let url = URL(string: urlString) else {
            completionHandler(nil, CoinListError.invalidURL)
            return
        }
        let request = URLRequest(url: url)
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            if let requestError = error {
                completionHandler(nil, CoinListError.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            guard let data = data else {
                completionHandler(nil, CoinListError.emptyData)
                return
            }
            
            DispatchQueue.main.async {
                do {
                    let decoder = JSONDecoder()
                    let responseObject = try decoder.decode(Criptocoin.self, from: data)
                    completionHandler(responseObject, nil)
                } catch {
                    completionHandler(nil, CoinListError.decodeError)
                }
            }
        }
        task.resume()
    }
}
