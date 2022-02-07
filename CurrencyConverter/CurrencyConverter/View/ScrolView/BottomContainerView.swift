import UIKit

class BottomContainerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContentView()
    }
    
   private func configureContentView(){
        backgroundColor = UIColor(named: "deepBlue")
    }
}
