//
//  DataStore.swift
//  EcommerceAssignentApp
//
//  Created by Shriram Kadam on 10/12/22.
//

import Foundation
import SwiftUI
import Combine

class DataStore: ObservableObject {

 
   
//     var allProductList = ProductBaseModel()
    @Published private(set) var baseProduct: [ProductBaseModel] = []
   // @Published private(set) var products: [Products] = []
    @Published private(set) var price: [Price] = []
    @Published private(set) var message: Messages?
    @Published private(set) var purchaseTypes: [PurchaseTypes] = []
    
    

    /// The article that the users has selected to be displayed in full detail.
    /// let title : String?
//    let id : String?
//    let imageURL : String?
//    let price : [Price]?
   
    
//   @Published var currentArticleNew: ProductBaseModel =  ProductBaseModel(products: [Products(citrusId: "", title: "", id: "", imageURL: "", price: [], brand: "", badges: [], ratingCount: 0.0, isAddToCartEnable: false, addToCartButtonText: "", isInTrolley: false, isInWishlist: false, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 0.0, totalReviewCount: 0, isDeliveryOnly: false, isDirectFromSupplier: false)])
    
    
    
    @Published private(set) var products: [Products] = []

    
   @Published var currentArticle: Products = Products(citrusId: "", title: "", id: "", imageURL: "", price: [], brand: "", badges: [], ratingCount: 0.0, isAddToCartEnable: false, addToCartButtonText: "", isInTrolley: false, isInWishlist: false, purchaseTypes: [], isFindMeEnable: false, saleUnitPrice: 0.0, totalReviewCount: 0, isDeliveryOnly: false, isDirectFromSupplier: false)
    
  

    
    private var userDefaults = UserDefaults.standard

    private var cancellables = Set<AnyCancellable>()

//    private let apiDomain: String = "run.mocky.io"
//    private let apiEndPoint: String = "/v3/de42e6d9-2d03-40e2-a426-8953c7c94fb8"
    
    private let apiDomain: String = "run.mocky.io"
    private let apiEndPoint: String = "/v3/2f06b453-8375-43cf-861a-06e95a951328"

    /// Returns the assembled URLComponents of the API endpoint.
    lazy private var productListUrlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = apiDomain
        components.path = apiEndPoint
        return components
    }()

    /// Unwraps the URL, there's no fallback since the URL is hardcoded.
    lazy private var productListUrl: URL = {
        guard let unwrappedUrl = productListUrlComponents.url else { fatalError("Wrong URL") }
        return unwrappedUrl
    }()

    init() {
        
        if userDefaults.object(forKey: "product") != nil {
            products = getStoredProducts(userDefaults.object(forKey: "product") as! Data)
        }

     
        getProductList()
    }


    
    private func getProductList() {
        NetworkManager.getData(url: productListUrl)
            .decode(type: ProductBaseModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    receiveValue: { (baseModel) in
        
        self.products = baseModel.products ?? []
        print(self.products.count)

            }
            .store(in: &cancellables)
    }

    private func getStoredProducts(_ data: Data) -> [Products] {
        guard let decodedProducts = try? JSONDecoder().decode([Products].self, from: data) else {return []}
        return decodedProducts
    }
    

    private func storeProducts(_ product: [Products]) {
        guard let encodedProducts = try? JSONEncoder().encode(product) else {return}
        self.userDefaults.set(encodedProducts, forKey: "product")
    }
}
