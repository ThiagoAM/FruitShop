//
//  ProductDetailViewModel.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import Foundation

class ProductDetailViewModel {
    
    let product: Product
    
    weak var addToCartDelegate: AddToCartDelegate?
    
    // MARK: Initialization
    
    init(product: Product, addToCartDelegate: AddToCartDelegate?) {
        self.product = product
        self.addToCartDelegate = addToCartDelegate
    }
    
    // MARK: - On Tap
    
    func onTapAddToCartButton() {
        addToCartDelegate?.addToCart(product: product)
    }
    
}
