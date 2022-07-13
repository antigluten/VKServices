//
//  UIStackView+Init.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import UIKit

extension UIStackView {
    convenience init(subviews: [UIView], spacing: CGFloat = 0, axis: NSLayoutConstraint.Axis = .horizontal) {
        self.init(frame: .zero)
        
        subviews.forEach {
            addSubview($0)
        }
        
        self.axis = axis
        self.spacing = spacing
    }
}
