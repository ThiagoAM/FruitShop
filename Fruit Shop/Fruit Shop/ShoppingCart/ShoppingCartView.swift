//
//  ShoppingCartView.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import UIKit
import PDFKit

class ShoppingCartView: UIViewController {
    
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var emptyCartLabel: UILabel!
    @IBOutlet weak var checkoutButton: UIButton!
    
    private let viewModel: ShoppingCartViewModel
    
    // MARK: - Initialization
    
    init(viewModel: ShoppingCartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupProductsTableView()
        setupCheckoutButtonAppearance()
        setupProductsTableViewVisibility()
        setupEmptyCartLabelVisibility()
        setupCheckoutButtonVisibility()
    }
    
    // MARK: - On Tap
    
    @IBAction func onTapCheckoutButton(_ sender: UIButton) {
        viewModel.onTapCheckoutButton()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        title = "Carrinho (\(viewModel.products.count))"
    }
    
    private func setupProductsTableView() {
        productsTableView.delegate = self
        productsTableView.dataSource = self
    }
    
    private func setupCheckoutButtonAppearance() {
        checkoutButton.clipsToBounds = true
        checkoutButton.layer.cornerRadius = 8
    }
    
    // Visibility
    
    private func setupProductsTableViewVisibility() {
        productsTableView.isHidden = viewModel.products.isEmpty
    }
    
    private func setupEmptyCartLabelVisibility() {
        emptyCartLabel.isHidden = !viewModel.products.isEmpty
    }
    
    private func setupCheckoutButtonVisibility() {
        checkoutButton.isHidden = viewModel.products.isEmpty
    }
    
}

// MARK: UITableViewDelegate

extension ShoppingCartView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = viewModel.products[indexPath.row]
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = "\(product.emoji) \(product.name)"
        cell.detailTextLabel?.text = product.price.formattedToBRL
        return cell
    }
    
}
