//
//  GenresRequest.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

struct GenresRequest: RequestProtocol {
    
    var request: URLRequest?
    
    private let url = URL(string: "https://itunes.apple.com/WebObjects/MZStoreServices.woa/ws/genres?id=34")
    
    init() {
        if url != nil {
            request = URLRequest(url: url!)
            request?.httpMethod = "GET"
        }
    }
    
}
