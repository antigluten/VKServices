//
//  VKAppRowCell.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 12.07.2022.
//

import UIKit

class VKAppRowCell: UITableViewCell {
    static let identifier = "VKAppRowCell"
    
    let appIcon = UIImageView()
    
    let appName = UILabel(text: "App Name", font: .systemFont(ofSize: 18))
    let appDescription = UILabel(text: "VK Bootcamp is a opportunity to show everybody what your's worth is...", font: .systemFont(ofSize: 12), numberOfLines: 2)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(appIcon)
        
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            appIcon.widthAnchor.constraint(equalToConstant: 64),
            appIcon.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        let verticalStack = UIStackView(arrangedSubviews: [
            appName, appDescription
        ])
        
        verticalStack.axis = .vertical
        verticalStack.distribution = .fill
        
//        appName.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        appDescription.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [
            appIcon, verticalStack
        ])
        
        stackView.spacing = 16
        stackView.axis = .horizontal
        
        stackView.distribution = .equalCentering
        
        stackView.distribution = .fill
        
        appIcon.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        let height: CGFloat = (80 - 64) / 2
        
        
        stackView.fillSuperview(padding: .init(top: height, left: 16, bottom: height, right: 50))
        
//        stackView.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            stackView.topAnchor.constraint(equalTo: topAnchor),
//            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
