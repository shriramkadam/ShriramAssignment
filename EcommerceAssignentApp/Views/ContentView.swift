//
//  ContentView.swift
//  EcommerceAssignentApp
//
//  Created by Shriram Kadam on 10/12/22.
//

import SwiftUI

struct ContentView: View {
    
    var product:Product = Product(id: "product123", image: Image("product01"), title: "Diamond Label Shiraz", price: 130.00, message: "Rosemount", reviews: [Review(name: "Shriram Kadam", ratingCount: 3.5, brand: "Rosemount")])
    
    @State var items:[Product] = [Product(id: "product01", image: Image("product01"), title: "Diamond Label Shiraz", price: 9.4, message: "Sponsored", reviews: [Review(name: "Shriram Kadam", ratingCount: 4, brand: "Rosemount")]),Product(id: "product02", image: Image("product02"), title: "Shiraz", price: 17.95, message: "Pepperjack", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.3364, brand: "Pepperjack")]),Product(id: "product03", image: Image("product03"), title: "Bin 389 Cabernet Shiraz 2019", price: 95, message: "in any six", reviews: [Review(name: "Shriram Kadam", ratingCount: 3.0, brand: "Penfolds")]),Product(id: "product04", image: Image("product04"), title: "Shiraz", price: 14.95, message: "in any six", reviews: [Review(name: "Shriram Kadam", ratingCount: 3.8556, brand: "Cat Amongst The Pigeons")]),Product(id: "product05", image: Image("product05"), title: "Cabernet Sauvignon", price: 17.95, message: "in any six", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.52, brand: "Pepperjack")]),Product(id: "product06", image: Image("product06"), title: "Barossa Ink Shiraz", price: 17.1, message: "in any six", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.3233, brand: "Grant Burge")]),Product(id: "product07", image: Image("product07"), title: "CR Shiraz", price: 21.95, message: "in any six", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.2588, brand: "Chris Ringland")]), Product(id: "product08", image: Image("product08"), title: "Black Label Red", price: 6.6, message: "in any six", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.5047, brand: "McGuigan")]), Product(id: "product09", image: Image("product09"), title: "Koonunga Hill Shiraz", price: 11.35, message: "in any six", reviews: [Review(name: "Shriram Kadam", ratingCount: 3.9649, brand: "Penfolds")]),Product(id: "product10", image: Image("product10"), title: "Little Yering Pinot Noir", price: 19.00, message: "in any six Yering Station", reviews: [Review(name: "Shriram Kadam", ratingCount: 3.8421, brand: "Yering Station")]),Product(id: "product11", image: Image("product11"), title: "Bin 555 Shiraz", price: 9.95, message: "in any six George Wyndham", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.2967, brand: "George Wyndham")]),Product(id: "product12", image: Image("product12"), title: "The Barossan Shiraz", price: 10.09, message: "per bottle Peter Lehmann", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.1818, brand: "Peter Lehmann")]),Product(id: "product13", image: Image("product13"), title: "Shiraz", price: 10.9, message: "in any six Annie's Lane", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.1, brand: "Annie's Lane")]),Product(id: "product14", image: Image("product14"), title: "Pinot Noir", price: 13.3, message: "in any six Tread Softly", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.4444, brand: "Tread Softly")]),Product(id: "product15", image: Image("product15"), title: "Koonunga Hill Cabernet Sauvignon", price: 11.35, message: "in any six Penfolds", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.4167, brand: "Penfolds")]),Product(id: "product16", image: Image("product16"), title: "Cabernet Sauvignon", price: 14.95, message: "in any six ", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.1783, brand: "Cat Amongst The Pigeons")]),Product(id: "product17", image: Image("product17"), title: "Bin 28 Shiraz 2019", price: 47.5, message: "in any six Penfolds", reviews: [Review(name: "Shriram Kadam", ratingCount: 5, brand: "Penfolds")]),Product(id: "product18", image: Image("product18"), title: "Shiraz", price: 13.25, message: "in any six Wynns", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.023, brand: "Wynns")]),Product(id: "product19", image: Image("product19"), title: "Cabernet d'Anjou Rosé", price: 12.95, message: "in any six La Planchelière", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.0411, brand: "La Planchelière")]),Product(id: "product20", image: Image("product20"), title: "Alexanders Vineyard Cabernet Sauvignon", price: 20.89, message: "in any six Franklin Tate Estates", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.1429, brand: "Franklin Tate Estates")]),Product(id: "product21", image: Image("product21"), title: "Barossa Shiraz", price: 17.9, message: "in any six Little Giant", reviews: [Review(name: "Shriram Kadam", ratingCount: 4.4853, brand: "Little Giant")])]
    
    @State var cart:[Product] = []
    @State var favorites:[Product] = []
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().isOpaque = true
        
        items.append(contentsOf:[product, product, product])
        cart.append(contentsOf: [product, product, product])
    }
    
    var body: some View {
        TabBar(images: [
            Image(systemName: "house.fill"),
            Image(systemName: "cart.fill"),
            Image(systemName: "heart.fill"),
        ], tabIndex: 0, contentTabs: [
            AnyView(ProductsView(products: $items, cart: $cart, favorites: $favorites)),
            AnyView(CartView(items: $cart)),
            AnyView(ProductsView(products: $favorites, cart: $cart, favorites: $favorites)),
        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
