//
//  CartRow.swift
//  EcommerceAssignentApp
//
//  Created by Shriram Kadam on 10/12/22.
//

import SwiftUI


struct CartRow: View {
    
    var item:Product
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            item.image
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80, alignment: .center)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 12) {
                Text("\(item.title)")
                    .font(Font.system(size: 17, weight: .regular, design: .rounded))
                Text("$\(String.init(format: "%.2f", item.price))")
                    .font(Font.system(size: 17, weight: .bold, design: .rounded))
            }
            
            Spacer()
        }
    }
}

