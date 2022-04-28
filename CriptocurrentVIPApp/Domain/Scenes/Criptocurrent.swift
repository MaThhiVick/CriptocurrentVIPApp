//
//  Model.swift
//  CriptocurrentApp
//
//  Created by Matheus Vicente on 29/03/22.
//
import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)


// MARK: - Welcome
struct Criptocurrent: Codable {
    let status: Status
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id, slug, symbol: String
    let metrics: Metrics
}

// MARK: - Metrics
struct Metrics: Codable {
    let marketData: MarketData

    enum CodingKeys: String, CodingKey {
        case marketData = "market_data"
    }
}

// MARK: - MarketData
struct MarketData: Codable {
    let priceUsd: Double

    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
    }
}

// MARK: - Status
struct Status: Codable {
    let elapsed: Int
    let timestamp: String
}

