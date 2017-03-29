//
//  SongsRequest.swift
//  MusicGame
//
//  Created by Constantine on 29.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

struct SongsRequest: RequestProtocol {
    
    var request: URLRequest?
    
    private var urlString = "https://itunes.apple.com/search?media=music&term="
    
    init(searchText: String) {
        
        urlString += searchText.stringWithSpecialCharactersChanging()
        
        guard let url = URL(string: urlString) else {
            request = nil
            return
        }
        
        request = URLRequest(url: url)
        request?.httpMethod = "GET"
    }
    
}
