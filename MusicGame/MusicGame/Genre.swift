//
//  Genre.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

struct Genre {
    let id: Int
    let name: String
    let topSongsUrl: String
    let subgenres: [Genre]
    var songs: [Song] = [Song]()
}

extension Genre {
    
    init(json: JSONStandart) {
        
        guard let name = json["name"] as? String,
            let id = Int(json["id"] as? String ?? ""),
            let rssUrls = json["rssUrls"] as? [String: String],
            let topSongsUrl = rssUrls["topSongs"] else {
                
                self.id = 0
                self.name = ""
                self.topSongsUrl = ""
                self.subgenres = [Genre]()
                
                return
        }
        
        
        self.id = id
        self.name = name
        self.topSongsUrl = topSongsUrl
        
        if let subgenresDictionary = json["subgenres"] as? JSONStandart {
            self.subgenres = subgenresDictionary.map({ ket, value -> Genre in
                return Genre(json: value as! JSONStandart)
            })
        } else {
            self.subgenres = [Genre]()
        }
    }
    
}
