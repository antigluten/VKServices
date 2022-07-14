//
//  VKAppRowCell.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import UIKit

class VKAppRowCell: UITableViewCell {
    // MARK: - Identifier
    static let identifier = "VKAppRowCell"
    
    // MARK: - Variables
    let appIcon = UIImageView()
    
    let appName = UILabel(text: "App Name", font: .systemFont(ofSize: 18))
    let appDescription = UILabel(text: "VK Bootcamp is a opportunity to show everybody what your's worth is...", font: .systemFont(ofSize: 12), numberOfLines: 2)
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(appIcon)
        
        accessoryType = .disclosureIndicator
        
        // MARK: - Add methods
        appIcon.constraintWidth(constant: 64)
        appIcon.constraintHeight(constant: 64)
        
        let verticalStack = UIStackView(subviews: [
            appName, appDescription
        ], axis: .vertical)
        
        verticalStack.distribution = .fill
        
        let stackView = UIStackView(subviews: [
            appIcon, verticalStack
        ], spacing: 16)
        
        stackView.distribution = .fill
        
        addSubview(stackView)
        
        let height: CGFloat = (80 - 64) / 2
        stackView.fillSuperview(padding: .init(top: height, left: 16, bottom: height, right: 40))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
