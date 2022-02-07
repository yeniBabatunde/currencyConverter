import Foundation

struct CurrencyModel: Codable {
        let success: Bool
        var timestamp: Int
        let base, date: String
        let rates: [String: Double]
}

struct Container {
    var base: [String]?
    var currency: [String]?
}

