//
//  UIViewController+Alert.swift
//  SiriusVK
//
//  Created by Vladimir Gusev on 14.07.2022.
//

import UIKit

extension UIViewController {
    func alert(title: String?, text: String?) {
        let alertVC = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel)
        alertVC.addAction(alertAction)
        present(alertVC, animated: true)
    }
}
