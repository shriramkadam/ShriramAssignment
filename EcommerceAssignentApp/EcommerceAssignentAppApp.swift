//
//  EcommerceAssignentAppApp.swift
//  EcommerceAssignentApp
//
//  Created by Shriram Kadam on 10/12/22.
//

import SwiftUI

@main
struct EcommerceAssignentAppApp: App {
    @StateObject var data: DataStore = DataStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(data)
        }
    }
}
