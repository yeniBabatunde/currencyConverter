import UIKit 
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

