//
//  ProductSelectionCoordinator.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import Foundation

class ProductSelectionCoordinator: Coordinator {
    
    override func start() {
        let viewModel = ProductSelectionViewModel(delegate: self)
        let view = ProductSelectionView(viewModel: viewModel)
        navigationController.pushViewController(view, animated: true)
    }
    
    func goToProductDetail(of product: Product) {
        let productDetailCoordinator = ProductDetailCoordinator(product: product, navigationController: navigationController)
        startChildCoordinator(productDetailCoordinator)
    }
    
    func goToCart() {
        let cartCoordinator = ShoppingCartCoordinator(navigationController: navigationController)
        startChildCoordinator(cartCoordinator)
    }
    
}

// MARK: - Product Selection

extension ProductSelectionCoordinator: ProductSelectionDelegate {
    
    func didTapCartButton() {
        goToCart()
    }
    
    func didSelectProduct(_ selectedProduct: Product) {
        goToProductDetail(of: selectedProduct)
    }
    
}
