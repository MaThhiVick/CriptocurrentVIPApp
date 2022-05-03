import Foundation

// MARK: - CriptocoinElement
struct CryptocoinElement: Codable {
    let id: String?
    let symbol: String?
    let name: String?
    let image: String?
    let current_price: Double?
    let marketCap: Int?
    let marketCapRank: Int?
    let fullyDilutedValuation: Int?
    let totalVolume: Double?
    let high24H: Double?
    let low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl: Double?
    let atlChangePercentage: Double?
    let atlDate: String?
    let roi: Roi?
    let lastUpdated: String?
}

// MARK: - Roi
struct Roi: Codable {
    let times: Double?
    let currency: Currency
    let percentage: Double?
}

enum Currency: String, Codable {
    case btc = "btc"
    case eth = "eth"
    case usd = "usd"
}

typealias Criptocoin = [CryptocoinElement]
