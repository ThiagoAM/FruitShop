//
//  Double+Currency.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 11/08/21.
//

import Foundation

extension Double {
    
    var formattedToBRL: String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        if let str = formatter.string(for: self) {
            return "R$ \(str)"
        }
        return nil
    }
    
}
