//
//  SearchSongsViewModel.swift
//  MusicGame
//
//  Created by Constantine on 29.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

protocol SearchSongsViewModelDelegate: class {
    func reloadViews()
}

class SearchSongsViewModel {
    
    weak var delegate: SearchSongsViewModelDelegate?
    
    private var songs: [Song] = [Song]()
    
    var numberOfRows: Int {
        return songs.count
    }
    
    func searchSongs(searchText: String) {
        
        NetworkDataFetcher.Songs.fetcthSongs(searchText: searchText) { songs in
            self.songs = songs
            self.delegate?.reloadViews()
        }
        
    }
    
    func viewModelForSearchedCell(atIndex index: Int) -> SongViewModel {
        return SongViewModel(song: songs[index])
    }
    
    
}
