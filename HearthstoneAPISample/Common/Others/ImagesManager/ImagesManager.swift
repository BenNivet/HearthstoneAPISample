//
//  ImagesManager.swift
//  HearthstoneAPISample
//
//  Created by Benjamin CANTE on 23/04/2019.
//  Copyright © 2019 com.Nivet. All rights reserved.
//

import UIKit

public class ImagesManager {
    
    static let shared = ImagesManager()
    
    let imageCache = NSCache<NSString, UIImage>()
    let defaultUIImage = UIImage(named: "defaultCard")
    
    func getCardImage(urlString: String, completion: ((UIImage?) -> Void)?) {
        guard let url = URL(string: urlString) else {
            completion?(defaultUIImage)
            return
        }
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            completion?(imageFromCache)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data,
                let imageToCache = UIImage(data: data) {
                self.imageCache.setObject(imageToCache, forKey: urlString as NSString)
                completion?(imageToCache)
            } else {
                if let defaultImage = self.defaultUIImage {
                    self.imageCache.setObject(defaultImage, forKey: urlString as NSString)
                }
                completion?(self.defaultUIImage)
            }
            }.resume()
    }
}
