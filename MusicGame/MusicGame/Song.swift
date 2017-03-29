//
//  Song.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

struct Song {
    let id: Int
    let name: String
    let artist: String
    let imageUrl: String
    let audioUrl: String
}

extension Song {
    
    init(json: JSONStandart) {
        
        guard let idDictionary = json["id"] as? JSONStandart,
            let idAttributes = idDictionary["attributes"] as? JSONStandart ,
            let id = Int(idAttributes["im:id"] as? String ?? ""),
            let nameDictionary = json["im:name"] as? JSONStandart,
            let name = nameDictionary["label"] as? String,
            let artistDictionary = json["im:artist"] as? JSONStandart,
            let artist = artistDictionary["label"] as? String,
            let imageArray = json["im:image"] as? [JSONStandart],
            let imageUrl = imageArray[0]["label"] as? String,
            let linkArray = json["link"] as? [JSONStandart],
            let audioAttributes = linkArray[0]["attributes"] as? JSONStandart,
            let audioUrl = audioAttributes["href"] as? String else {
                
                self.id = 0
                self.name = ""
                self.artist = ""
                self.imageUrl = ""
                self.audioUrl = ""
                return
            }
        
        
        self.id = id
        self.name = name
        self.artist = artist
        self.imageUrl = imageUrl.resizedImageString()
        self.audioUrl = audioUrl
    }
    
}
