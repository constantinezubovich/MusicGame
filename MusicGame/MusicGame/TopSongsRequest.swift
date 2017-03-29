//
//  TopSongsRequest.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

struct TopSongsRequest: RequestProtocol{
    
    var request: URLRequest?
    
    init(genre: Genre) {
        
        guard let url = URL(string: genre.topSongsUrl) else {
            request = nil
            return
        }
        
        request = URLRequest(url: url)
        request?.httpMethod = "GET"
        
    }
    
}
