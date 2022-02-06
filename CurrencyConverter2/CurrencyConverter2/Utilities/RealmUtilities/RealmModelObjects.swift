import Foundation
import RealmSwift

class Currency: Object {
     dynamic var currency = List<CurrencyDictionary>()
}

class CurrencyDictionary: Object {
    @objc dynamic var currency: String = ""
    @objc dynamic var rate: Double = 0.0
}
