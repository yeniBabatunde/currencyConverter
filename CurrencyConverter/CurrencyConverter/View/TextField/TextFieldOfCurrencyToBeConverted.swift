import UIKit

class CurrencyToBeConverted: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextField()
        
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        setUpTextField()
    }

   private func setUpTextField(){
       self.layer.borderColor = UIColor.lightGray.cgColor
       self.layer.borderWidth = 1
       self.backgroundColor = UIColor(named: "offWhite")
       self.textColor = .black
       self.autocorrectionType = .no
       self.clipsToBounds = true
       self.leftViewMode = .always
    }
}

