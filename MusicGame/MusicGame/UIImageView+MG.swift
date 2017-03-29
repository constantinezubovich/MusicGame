//
//  UIImageView+MG.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation
import UIKit

private let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(urlString: String) {
        self.image = nil
        
        if let cacheImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cacheImage
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    self.image = downloadedImage
                }
            }
            
        }.resume()
        
        
    }
    
}
