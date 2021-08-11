//
//  Product.swift
//  Fruit Shop
//
//  Created by Thiago Martins on 09/08/21.
//

import Foundation

struct Product {
    var name: String
    var emoji: String
    var price: Double
    var category: Category
    var description: String
}

// MARK: - Category

extension Product {
    
    enum Category {
        case fruits
    }
    
}

// MARK: - Data Source

extension Product {
    
    static func load(_ category: Category, completion: @escaping (_ products: [Product]) -> Void) {
        // Mocking the data, as if it came from a server.
        let categoryProducts = productsMock.filter { $0.category == category }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion(categoryProducts)
        }
    }
    
    private static var productsMock: [Product] = [
        Product(
            name: "Maçã Gala 1kg",
            emoji: "🍎",
            price: 2.99,
            category: .fruits,
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur quis sem viverra, vestibulum turpis eget, vestibulum magna. Vestibulum at mauris ex. Etiam id volutpat diam, id mollis mauris. Phasellus tempor auctor magna, quis faucibus velit maximus auctor. Etiam at vehicula odio. Praesent et malesuada dui, sit amet rutrum justo."
        ),
        Product(
            name: "Pêra 1kg",
            emoji: "🍐",
            price: 1.99,
            category: .fruits,
            description: "Ut pellentesque malesuada sem quis feugiat. Donec maximus vestibulum condimentum. Mauris viverra consequat justo at ultricies. Nam mollis mattis est, eget pharetra justo molestie ut. Aliquam vitae enim vel tellus auctor sollicitudin nec et elit. Etiam maximus auctor facilisis. Vivamus congue non erat nec porta."
        ),
        Product(
            name: "Banana Prata 1kg",
            emoji: "🍌",
            price: 0.99,
            category: .fruits,
            description: "Pellentesque suscipit urna in massa ornare condimentum. Proin pulvinar nulla a velit luctus, a tempor ante ultrices."
        ),
        Product(
            name: "Abacaxi (unidade)",
            emoji: "🍍",
            price: 4.99,
            category: .fruits,
            description: "Cras lobortis neque at nibh mattis ullamcorper. Duis ut volutpat orci, et mattis nisl. Sed at tellus non lorem rhoncus sagittis quis in ante. Pellentesque venenatis, lorem et auctor semper, arcu urna faucibus dui, et scelerisque neque nibh quis ante."
        ),
        Product(
            name: "Manga 1kg",
            emoji: "🥭",
            price: 3.99,
            category: .fruits,
            description: "Nulla finibus placerat enim. In hac habitasse platea dictumst. Integer a vulputate nisi. Integer hendrerit augue in ultricies fermentum."
        ),
    ]
    
}

// MARK: - Product PDF Generation

extension Array where Element == Product {
    
    var htmlReceipt: String {
        var html = ""
        var total: Double = 0.0
        // Title
        html += "Comprovante Fruit Shop<br><br>"
        // Products
        html += "Produtos comprados:<br><br>"
        for product in self {
            html += "\(product.name) - <b>\(product.price.formattedToBRL ?? "")</b><br>"
            total += product.price
        }
        // Total
        html += "<br>Total: <b> \(total.formattedToBRL ?? "")</b>"
        return html
    }
    
}
