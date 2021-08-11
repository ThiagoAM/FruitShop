//
//  PDFViewer.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 11/08/21.
//

import UIKit
import PDFKit

class PDFViewer: UIViewController {
    
    private let viewModel: PDFViewerViewModel
    
    // MARK: Initialization
    
    init(viewModel: PDFViewerViewModel) {
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let pdfView = PDFView(frame: self.view.bounds)
        self.view.addSubview(pdfView)
        pdfView.autoScales = true
        pdfView.document = viewModel.pdfDocument
    }
    
    // MARK: - On Tap
    
    @objc private func onTapShareButton() {
        if let pdfData = viewModel.pdfDocument.dataRepresentation() {
            let objectsToShare = [pdfData]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = navigationItem.rightBarButtonItem?.customView
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    // MARK: - Setup
    
    private func setupNavigationBar() {
        let button = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(onTapShareButton))
        self.navigationItem.rightBarButtonItem  = button
    }
    
}
