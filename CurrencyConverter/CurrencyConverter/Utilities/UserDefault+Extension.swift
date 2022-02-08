import UIKit

extension UserDefaults {
    
    func setIsLoggedIn() -> Bool {
       return bool(forKey: "isLoggedIn")
    }
    func isLoggedIn(value: Bool) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
    }
    func setIsUserOnboarded() -> Bool {
        return bool(forKey: "isOnboarded")
    }
}

