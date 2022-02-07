
import Foundation
import RealmSwift

final class RealmPersistenceStore: PersistenceStore {
    
    let realm = try! Realm()

    func saveData(of currency: Currency) {
        try! self.realm.write {
            self.realm.refresh()
            self.realm.add(currency)
        }
    }
    func readData() -> Results<Currency> {
        let items = realm.objects(Currency.self)
        return items
    }
    func delete(){
        try! realm.write {
          realm.deleteAll()
        }
    }
}

protocol PersistenceStore {
    func saveData(of currency: Currency)
    func readData() -> Results<Currency>
}
