import UIKit

class TextFieldOfCurrencyConverted: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextFieldConfiguration()
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        setUpTextFieldConfiguration()
    }

    
    func setUpTextFieldConfiguration(){
        self.layer.borderColor = UIColor.lightGray.cgColor // color you want
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor(named: "offWhite")
        self.textColor = .black
        self.autocorrectionType = .no
        self.clipsToBounds = true
        self.leftViewMode = .always
    }
}

