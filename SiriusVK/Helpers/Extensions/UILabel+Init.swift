//
//  UILabel+Init.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        
        self.numberOfLines = numberOfLines
        self.font = font
        self.text = text
    }
}
