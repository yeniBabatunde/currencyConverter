import UIKit

class ScrollView: UIScrollView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureScrollView()
    }
    
    private func configureScrollView(){
        backgroundColor = .white
       
    }
    
}
