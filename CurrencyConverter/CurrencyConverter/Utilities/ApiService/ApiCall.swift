import UIKit
import Alamofire
import RealmSwift

class ApiCall{
    
    let realm = try! Realm()
    fileprivate var urlLink: String
    
    init(urlLink: String){
        self.urlLink = urlLink
    }
    func getData(completionHandler: @escaping (CurrencyModel) -> Void){
        AF.request(urlLink).responseDecodable(of: CurrencyModel.self) { result in
            if let response = result.value{
                completionHandler(response)
            }
        }
    }
    }
    
    
    
    
    
    
    

