import UIKit

class CurrentTimeLabel: UILabel {
//    let viewModel = CurrencyViewModel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        configureLabel()
    }
    private func configureLabel(){
        font = UIFont.systemFont(ofSize: 16, weight: .regular)
        text =  "Mid-market exchange rate at 13:45 UTC"
    }
    
    
}


