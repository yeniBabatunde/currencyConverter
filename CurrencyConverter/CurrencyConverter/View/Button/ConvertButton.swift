import UIKit
import Alamofire

class ConvertButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureButton()
    }
    func configureButton(){
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = UIColor(named: "greenShade")
    }
}


