//
//  ProductsView.swift
//  EcommerceAssignentApp
//
//  Created by Shriram Kadam on 10/12/22.
//

import SwiftUI

struct ProductsView: View {
    
    @Binding var products:[Product]
    @Binding var cart:[Product]
    @Binding var favorites:[Product]
    
    var body: some View {
        
        var prods: [[Product]] = []
        _ = (products).publisher
            .collect(products.count % 2 == 1 ? (products.count / 2) + 1 : (products.count / 2))
            .collect()
            .sink(receiveValue: { prods = $0 })
        
        
        return NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                
                VStack(spacing: 18){
                    HStack{
                        Text("Product List")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.primary)
                        Spacer(minLength: 0)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal)
                
                
                HStack(alignment: .top, spacing: 10) {
            
                    if prods.count > 0 {
                        VStack(alignment: .center, spacing: 8) {
                            ForEach(prods[0], id: \.id) { prod in
                                NavigationLink(destination:
                                    ProductDetailView(product: prod, cart: self.$cart, favorites: self.$favorites)
                                        .padding(.horizontal, 16)
                                        
                                ) {
                                    ProductListCell(product: prod, cart: self.$cart, favorites: self.$favorites)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    
                    if prods.count == 2 {
                        VStack(alignment: .center, spacing: 8) {
                            ForEach(prods[1], id: \.id) { prod in
                                NavigationLink(destination:
                                                ProductDetailView(product: prod, cart: self.$cart, favorites: self.$favorites)
                                        .padding(.horizontal, 16)
                                ) {
                                    ProductListCell(product: prod, cart: self.$cart, favorites: self.$favorites)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    
                    if prods.count == 0 {

                        VStack(alignment: .center, spacing: 4) {
                            Spacer()
                            Image(systemName: "bag.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.gray)
                                .frame(width: 40, height: 40, alignment: .center)
                                .padding(.bottom, 20)
                                .font(Font.system(size: 16, weight: .bold, design: .rounded))
                            Text("No Products To Display")
                                .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        .navigationBarTitle("Favourite List", displayMode: .inline)
                        .navigationBarHidden(true)
                        
                    }
                    
                }
               
                .padding()
            }
            //.background(Color.secondary)
            .padding(.bottom, 50)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
        
    }
}
