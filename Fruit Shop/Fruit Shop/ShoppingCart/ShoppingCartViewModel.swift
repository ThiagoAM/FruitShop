//
//  ShoppingCartViewModel.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import Foundation

class ShoppingCartViewModel {
    
    weak var cartDelegate: CartDelegate?
    
    private let pdfCreator = PDFCreator()
    
    // MARK: Initialization
    
    init(cartDelegate: CartDelegate?) {
        self.cartDelegate = cartDelegate
    }
    
    // MARK: Getters
    
    var products: [Product] {
        Cart.shared.products
    }
    
    // MARK: - On Tap
    
    func onTapCheckoutButton() {
        pdfCreator.create(from: products.htmlReceipt) { pdfDocument in
            if let pdfDocument = pdfDocument {
                self.cartDelegate?.cartCheckout(pdfDocument: pdfDocument)
            }            
        }
    }
    
}
