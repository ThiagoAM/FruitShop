//
//  UINavigationController+Alert.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 11/08/21.
//

import UIKit

extension UINavigationController {
    
    func presentOkAlert(title: String?, message: String?, okText: String = "OK", okCompletion: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.overrideUserInterfaceStyle = overrideUserInterfaceStyle
        let okAction = UIAlertAction(title: okText, style: .default, handler: okCompletion)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
