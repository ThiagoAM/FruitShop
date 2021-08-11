//
//  ProductDetailView.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import UIKit

class ProductDetailView: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    private let viewModel: ProductDetailViewModel
    
    // MARK: Initialization
    
    init(viewModel: ProductDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewData()
        setupAddToCartButton()
    }
    
    // MARK: - On Tap
    
    @IBAction func onTapAddToCartButton(_ sender: UIButton) {
        viewModel.onTapAddToCartButton()
    }
    
    // MARK: - Setup
    
    private func setupViewData() {
        titleLabel.text = viewModel.product.name
        emojiLabel.text = viewModel.product.emoji
        priceLabel.text = viewModel.product.price.formattedToBRL
        productDescription.text = viewModel.product.description
    }
    
    private func setupAddToCartButton() {
        addToCartButton.clipsToBounds = true
        addToCartButton.layer.cornerRadius = 8
    }
    
}
