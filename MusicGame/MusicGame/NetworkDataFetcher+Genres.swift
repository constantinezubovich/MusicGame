//
//  NetworkDataFetcher+Genres.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

extension NetworkDataFetcher {
    
    final class Genres: NetworkDataLoadable {
        
        class func fetchGenres(completion: @escaping (([Genre]) -> ())) {
            
            let genresRequest = GenresRequest()
            
            loadData(request: genresRequest) { data in
                
                let jsonData = try? JSONSerialization.jsonObject(with: data, options: [])
                
                guard let json = jsonData as? JSONStandart,
                      let genreKey = json.keys.first,
                      let musicDictionary = json[genreKey] as? JSONStandart,
                      let genresDictionary = musicDictionary["subgenres"] as? JSONStandart else { return }
                
                
                completion(
                    genresDictionary.map({ ket, value -> Genre in
                        return Genre(json: value as! JSONStandart)
                    })
                )
                
            }
            
        }
        
    }
    
}
