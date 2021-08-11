//
//  PDFCreator.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 11/08/21.
//

import UIKit
import PDFKit

class PDFCreator: NSObject {
    
    func create(from html: String, completion: (PDFDocument?) -> Void) {
        let render = UIPrintPageRenderer()
        let fmt = UIMarkupTextPrintFormatter(markupText: html)
        render.addPrintFormatter(fmt, startingAtPageAt: 0)
        let page = CGRect(x: 0, y: 0, width: 612, height: 792)
        let printable = page.insetBy(dx: 0, dy: 0)
        render.setValue(NSValue(cgRect: page), forKey: "paperRect")
        render.setValue(NSValue(cgRect: printable), forKey: "printableRect")
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
        for i in 0..<render.numberOfPages {
            UIGraphicsBeginPDFPage()
            render.drawPage( at: i, in: UIGraphicsGetPDFContextBounds())
        }
        UIGraphicsEndPDFContext()
        completion(PDFDocument(data: pdfData as Data))
    }
    
}
