//
//  ProductSelectionViewModel.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import Foundation

class ProductSelectionViewModel {
    
    weak var view: Refreshable?
    weak var delegate: ProductSelectionDelegate?
    
    private var model = ProductSelectionModel()
    
    // MARK: Initialization
    
    init(delegate: ProductSelectionDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: - Loading
    
    func loadInitialData() {
        // Loading the fruits
        model.isLoading = true
        view?.refresh()
        Product.load(.fruits) { products in
            self.model.products = products
            self.model.isLoading = false
            self.view?.refresh()
        }
    }
    
    // MARK: - Search Bar
    
    func searchTextDidUpdate(with text: String?) {
        model.searchText = text
        view?.refresh()
    }
    
    // MARK: - On Tap
    
    @objc func onTapCartButton() {
        delegate?.didTapCartButton()
    }
    
    func onTapProductCell(_ product: Product) {
        delegate?.didSelectProduct(product)
    }
    
    // MARK: - Getters
    
    var products: [Product] {
        guard let searchText = model.searchText?.lowercased(), !searchText.isEmpty else {
            return model.products
        }
        return model.products.filter { product in
            product.name.lowercased().contains(searchText)
        }
    }
    
    var isLoading: Bool { model.isLoading }
    
}
