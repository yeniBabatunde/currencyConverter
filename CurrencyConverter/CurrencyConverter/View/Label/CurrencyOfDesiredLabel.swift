//
//  CurrencyOfDesiredLabel.swift
//  CurrencyConverter
//
//  Created by Decagon on 26/01/2022.
//

import Foundation
import UIKit

class desiredCurrencyLabel:UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLabel()
    }
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        configureLabel()
    }
   private func configureLabel(){
//       font = UIFont.systemFont(ofSize: 50, weight: .bold)
       
    }
    
}
