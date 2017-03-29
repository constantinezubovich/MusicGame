//
//  NetworkDataFetcher+Songs.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

extension NetworkDataFetcher {
    
    final class Songs: NetworkDataLoadable {
        
        class func fetchTopSongs(genre: Genre, completion: @escaping (([Song]) -> ())) {
            
            let topSongsRequest = TopSongsRequest(genre: genre)
            
            loadData(request: topSongsRequest) { data in
                
                let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                
                guard let json = jsonData as? JSONStandart,
                    let feed = json["feed"] as? JSONStandart,
                    let entry = feed["entry"] as? [JSONStandart] else { return }
                
                completion(entry.flatMap { Song(json: $0) })
            }
            
        }
        
        class func fetcthSongs(searchText: String,  completion: @escaping (([Song]) -> ())) {
            
            let songsRequest = SongsRequest(searchText: searchText)
            
            loadData(request: songsRequest) { data in
                
                let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                
                guard let json = jsonData as? JSONStandart,
                    let results = json["results"] as? [JSONStandart] else { return }
                
                completion(results.flatMap { Song(searchJSON: $0) })
            }
            
        }
        
    }
    
}
