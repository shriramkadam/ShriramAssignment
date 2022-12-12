//
//  ImageLoader.swift
//  EcommerceAssignentApp
//
//  Created by Shriram Kadam on 11/12/22.
//

import Foundation
import Combine
import SwiftUI

/// Responsible for loading a specific image.
/// It first checks if the image is on the cache, then if it's on local storage and only then it loads it from the internet.
/// 
class ImageLoader: ObservableObject {

    @Published var image: UIImage?

    private let url: String
    private let id: String
    private var cancellable: AnyCancellable?

    init(url: String, id: String) {
        self.url = url
        self.id = id
        load()
    }

    deinit {
        cancellable?.cancel()
    }

    private func load() {

        let fileUrl = URL(string: self.url)

        
        /// Checks if the image already exists in the cache, if so it loads it.
        if let cachedImage = ImageCache.shared.cache.object(forKey: URL(string: self.url) as! NSURL) {
            self.image = cachedImage
            return
        }

        /// Checks if the image already exists in the local storage, if so it loads it and caches it.
        if let storedImage = ImagesStorage.shared.getImage(imageName: String(id)) {
            self.image = storedImage
            cacheImage(storedImage)
            return
        }

        /// Gets the image from the internet.
        cancellable = NetworkManager.getData(url: (fileUrl! as NSURL) as URL)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] (image) in
                self?.saveImage(image)
                self?.cacheImage(image)
                self?.image = image
            })
    }

    /// Saves the image to local storage.
    private func saveImage(_ image: UIImage?) {
        if image != nil {
            ImagesStorage.shared.saveImage(image: image!, imageName: String(id))
        }
    }

    /// Savesthe image in the cache.
    private func cacheImage(_ image: UIImage?) {
        if image != nil {
            ImageCache.shared.cache.setObject(image!, forKey: URL(string: self.url) as! NSURL)
        }
    }
}
