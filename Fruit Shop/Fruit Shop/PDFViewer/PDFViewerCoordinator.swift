//
//  PDFViewerCoordinator.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 11/08/21.
//

import UIKit
import PDFKit

class PDFViewerCoordinator: Coordinator {
    
    private let pdfDocument: PDFDocument
    
    init(pdfDocument: PDFDocument, navigationController: UINavigationController, parent: Coordinator? = nil) {
        self.pdfDocument = pdfDocument
        super.init(navigationController: navigationController, parent: parent)
    }
    
    override func start() {
        let viewModel = PDFViewerViewModel(pdfDocument: pdfDocument)
        let view = PDFViewer(viewModel: viewModel)
        navigationController.pushViewController(view, animated: true)
    }
    
}
