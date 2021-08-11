//
//  ProductSelectionView.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 09/08/21.
//

import UIKit

class ProductSelectionView: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let viewModel: ProductSelectionViewModel
    
    // MARK: - Initialization
    
    init(viewModel: ProductSelectionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSearchBar()
        setupProductsTableView()
        viewModel.loadInitialData()
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        title = "Fruit Shop"
        let button = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: viewModel, action: #selector(viewModel.onTapCartButton))
        navigationItem.rightBarButtonItem  = button
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.enablesReturnKeyAutomatically = true
        searchBar.placeholder = "Buscar no Fruit Shop"
    }
    
    private func setupProductsTableView() {
        productsTableView.delegate = self
        productsTableView.dataSource = self
    }
    
}

// MARK: - Search Bar Delegate

extension ProductSelectionView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchTextDidUpdate(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension ProductSelectionView: UITableViewDataSource, UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onTapProductCell(viewModel.products[indexPath.row])
    }
    
}

// MARK: - Refreshable

extension ProductSelectionView: Refreshable {
    
    func refresh() {
        activityIndicator.isHidden = !viewModel.isLoading
        productsTableView.reloadData()
    }
    
}
