//
//  EcommerceAssignentAppTests.swift
//  EcommerceAssignentAppTests
//
//  Created by Shriram Kadam on 10/12/22.
//

import XCTest
import Combine
@testable import EcommerceAssignentApp
import SwiftUI

final class EcommerceAssignentAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testModelComputedProperties() throws {
        /// Tests the computed properties of the data model

        var product:Product = Product(id: "product123", image: Image("product01"), title: "Diamond Label Shiraz", price: 130.00, message: "Rosemount", reviews: [Review(name: "Shriram Kadam", ratingCount: 3.5, brand: "Rosemount")])
       
        
        XCTAttachment(string: "Diamond Label Shiraz")
        XCTAttachment(string: "https://i.picsum.photos/id/0/5000/3333.jpg?hmac=_j6ghY5fCfSD6tvtcV74zXivkJSPIfR9B8w34XeQmvU")

    }

    func testNetworkManager() throws {

        let url = URL(string: "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328")!
  
        var result: [Products] = []
        var cancellables = Set<AnyCancellable>()
        let expectation = self.expectation(description: "received")

        NetworkManager.getData(url: url)
            .decode(type: [Products].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { (articles) in
                result = articles
                expectation.fulfill()
            }
            .store(in: &cancellables)

        waitForExpectations(timeout: 5)
        XCTAssertTrue(!result.isEmpty, "NetworkManager published an empty array.")
    }

    func testImageLoader() throws {
        /// Tests if the ImageLoader publishes and image

       
        let expectation = self.expectation(description: "received")
        var image: UIImage?

        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {

        })

        waitForExpectations(timeout: 5)
        XCTAssertTrue(image != nil, "ImageLoader didn't publish an image")

        let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first?.appendingPathComponent("images").appendingPathComponent("17.png")
        try FileManager.default.removeItem(atPath: url!.path)
    }

    func testViewModel() throws {
        /// Tests if the view models correctly fetches data from the internet

        let viewModel = DataStore()
        let testProduct = Product(id: "product123", image: Image("product01"), title: "Diamond Label Shiraz", price: 130.00, message: "Rosemount", reviews: [Review(name: "Shriram Kadam", ratingCount: 3.5, brand: "Rosemount")])

        XCTAssertTrue(!viewModel.products.isEmpty, "Product array is empty")
     
       
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
