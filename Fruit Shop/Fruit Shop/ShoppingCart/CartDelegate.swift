//
//  CartDelegate.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 11/08/21.
//

import Foundation
import PDFKit

protocol CartDelegate: AnyObject {
    func cartCheckout(pdfDocument: PDFDocument)
}
