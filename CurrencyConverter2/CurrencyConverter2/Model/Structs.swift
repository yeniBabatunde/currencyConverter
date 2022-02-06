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

typealias UnixTime = Int

extension UnixTime {
    private func formatType(form: String) -> DateFormatter {
        let df = DateFormatter()
        df.locale = Locale(identifier: "en_US")
        df.dateFormat = form
        return df
    }
    
    var dateFull: Date {
        return Date(timeIntervalSince1970: Double(self))
    }
    
    var toHour: String {
        return formatType(form: "HH:mm").string(from: dateFull)
    }
}
