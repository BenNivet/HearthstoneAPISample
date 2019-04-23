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
    
    func getImage(urlString: String, completion: ((UIImage?) -> Void)?) {
        guard let url = URL(string: urlString) else {
            completion?(nil)
            return
        }
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            completion?(imageFromCache)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                if let imageToCache = UIImage(data: data) {
                    self.imageCache.setObject(imageToCache, forKey: urlString as NSString)
                    completion?(imageToCache)
                } else {
                    completion?(nil)
                }
            } else {
                completion?(nil)
            }
        }
        if completion == nil {
            task.priority = URLSessionTask.lowPriority
        } else {
            task.priority = URLSessionTask.highPriority
        }
        task.resume()
    }
}
