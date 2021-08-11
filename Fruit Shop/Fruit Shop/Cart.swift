//
//  Cart.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import Foundation

class Cart {
    
    static var shared = Cart()
    
    var products: [Product] = []
    
}

// MARK: - AddToCartDelegate

protocol AddToCartDelegate: AnyObject {
    func addToCart(product: Product)
}
