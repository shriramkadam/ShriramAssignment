//
//  ProductDetailView.swift
//  EcommerceAssignentApp
//
//  Created by Shriram Kadam on 10/12/22.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product:Product
    @Binding var cart:[Product]
    @Binding var favorites:[Product]
    
    @State private var showShareSheet = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 18){
                HStack{
                    Text("Product Detail")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.primary)
                    Spacer(minLength: 0)
                }
            }
            .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 8) {
                product.image
                .resizable()
                .scaledToFill()
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.title)
                        .font(Font.system(size: 24, weight: .semibold, design: .rounded))
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(Font.system(size: 19, weight: .semibold, design: .rounded))
                }
                
                HStack(alignment: .center, spacing: 0) {
                    Button(action: {
                        if self.favorites.contains(where: { (fav) -> Bool in
                            fav.id == self.product.id
                        }) {
                            self.favorites.removeAll { (fav) -> Bool in
                                fav.id == self.product.id
                            }
                        } else {
                            self.favorites.append(self.product)
                        }
                        
                        
                        
                    }) {
                        if self.favorites.contains(where: { (fav) -> Bool in
                            fav.id == product.id
                        }) {
                            Image(systemName: "heart.fill")
                            .foregroundColor(Color.red)
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        } else {
                            Image(systemName: "heart")
                            .foregroundColor(Color.black)
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                        
                    }
                  
                    Spacer()
                    Button(action: {
                        if self.cart.contains(where: { (prod) -> Bool in
                            prod.id == self.product.id
                        }) {
                            self.cart.removeAll { (prod) -> Bool in
                                prod.id == self.product.id
                            }
                        } else {
                            self.cart.append(self.product)
                        }
                    }) {
                        if self.cart.contains(where: { (prod) -> Bool in
                            prod.id == self.product.id
                        }) {
                            HStack(alignment: .center, spacing: 20) {
                                Text("IN YOUR CART")
                                Image(systemName: "checkmark")
                            }
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.gray)
                            .cornerRadius(10)
                        } else {
                            HStack(alignment: .center, spacing: 20) {
                                Text("ADD TO CART")
                                Image(systemName: "cart.fill")
                            }
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color(red: 111/255, green: 115/255, blue: 210/255))
                            .cornerRadius(10)
                        }
                        
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                
                Text(product.message)
                    .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                
                Divider()
                
                VStack {
                    Text("Reviews")
                        .font(Font.system(size: 19, weight: .semibold, design: .rounded))
                    Text("\(product.reviews.count) review\(product.reviews.count == 1 ? "" : "s")")
                        .font(Font.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.gray)
                }
                RatingView(ratingCount: product.ratingCount, primaryColor: Color.yellow, secondaryColor: Color.gray)
                Divider()
                
                VStack {
                    ForEach(self.product.reviews.indices) { i in
                        HStack{
                            Text("\(self.product.reviews[i].name)")
                                .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            Spacer()
                            RatingView(ratingCount: self.product.reviews[i].ratingCount, primaryColor: Color.yellow, secondaryColor: Color.gray)
                        }
                        Text("\(self.product.reviews[i].brand)")
                    }
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 70)
        }

    }
}

