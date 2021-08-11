//
//  ProductSelectionDelegate.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import Foundation

protocol ProductSelectionDelegate: AnyObject {
    func didTapCartButton()
    func didSelectProduct(_ selectedProduct: Product)
}
