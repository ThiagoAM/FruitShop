//
//  ShoppingCartCoordinator.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 10/08/21.
//

import Foundation
import PDFKit

class ShoppingCartCoordinator: Coordinator {
    
    override func start() {
        let viewModel = ShoppingCartViewModel(cartDelegate: self)
        let view = ShoppingCartView(viewModel: viewModel)
        navigationController.pushViewController(view, animated: true)
    }
    
    func goToPDFViewer(pdfDocument: PDFDocument) {
        let coordinator = PDFViewerCoordinator(pdfDocument: pdfDocument, navigationController: navigationController)
        startChildCoordinator(coordinator)
    }
    
}

// MARK: - Cart Delegate

extension ShoppingCartCoordinator: CartDelegate {
    
    func cartCheckout(pdfDocument: PDFDocument) {
        goToPDFViewer(pdfDocument: pdfDocument)
    }
    
}
