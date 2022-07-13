//
//  UIImageView+Init.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import UIKit

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        contentMode = .scaleAspectFill
    }
}
