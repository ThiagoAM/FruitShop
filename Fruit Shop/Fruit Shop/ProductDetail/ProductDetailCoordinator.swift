//
//  ProductDetailCoordinator.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import UIKit

class ProductDetailCoordinator: Coordinator {
    
    private var product: Product!
    
    init(product: Product, navigationController: UINavigationController, parent: Coordinator? = nil) {
        self.product = product
        super.init(navigationController: navigationController, parent: parent)
    }
    
    override func start() {
        let viewModel = ProductDetailViewModel(product: product, addToCartDelegate: self)
        let view = ProductDetailView(viewModel: viewModel)
        navigationController.pushViewController(view, animated: true)
    }
    
    // MARK - Alerts
    
    func presentAddedToCardAlert() {
        navigationController.presentOkAlert(title: "Tudo certo!", message: "Produto adicionado ao carrinho com sucesso.")
    }
    
}

// MARK: - AddToCartDelegate

extension ProductDetailCoordinator: AddToCartDelegate {
    
    func addToCart(product: Product) {
        Cart.shared.products.append(product)
        presentAddedToCardAlert()
    }
    
}
