import Foundation
import RealmSwift

final class CurrencyViewModel {

    var persistedRateList: Results<Currency>?
    var persistRate: CurrencyDictionary?
    var currency = Currency()
    var currencyObject: [CurrencyDictionary]?
    var timeStamp = 0
    var date = ""
    var loadCurrencyDropDown: [String] = []
    let persistRealm = RealmPersistenceStore()
    var base: [String] = [String]()
    var urlString: String?
    var apiClass: ApiCall?
    var readDataSaved : ((Bool) -> Void)?
    var rateArray = [Double]()
    var getConversionRate: (([Double]) -> Void)?
    var getDate: ((Int) -> Void)?
    
    init(apiString: String) {
        self.urlString = apiString
        apiClass = ApiCall(urlLink: urlString ?? "maximum number of calls have been made please change Apikey")
    }
    
    func saveData(){
        apiClass?.getData(completionHandler: { [self] result in
            self.base.append(result.base)
            self.date = result.date
            self.timeStamp = result.timestamp
            
            for (key, value) in result.rates{
                persistRate = CurrencyDictionary()
                persistRate?.currency = key
                persistRate?.rate = value
                currency.currency.append(persistRate!)
                rateArray.append(value)
                getDate?(timeStamp)
                getConversionRate?(rateArray)
            }
            persistRealm.delete()
            persistRealm.saveData(of: currency)
            readDataSaved?(true)
        })
    }
    
    func passRetreivedData(completionHandler: ( @escaping (Container) -> Void )){
        var a : Container?
        readDataSaved = { dataAvailable in
            if dataAvailable {
                self.fetchDataFromRealm()
                a = Container(base: self.base, currency: self.loadCurrencyDropDown)
                completionHandler(a!)
            }
        }
    }
    
    func fetchDataFromRealm(){
        self.persistedRateList = persistRealm.readData()
        let data = persistedRateList?.first?.currency
        if let keys = data {
            for i in 0..<keys.count {
                loadCurrencyDropDown.append(keys[i].currency)
            }
        }
    }
}
