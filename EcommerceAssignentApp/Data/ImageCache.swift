//
//  ImageCache.swift
//  EcommerceAssignentApp
//
//  Created by Shriram Kadam on 11/12/22.
//

import SwiftUI


class ImageCache {

    static var shared = ImageCache()
    var cache = NSCache<NSURL, UIImage>()

    init() {
        cache.countLimit = 100
    }
}
