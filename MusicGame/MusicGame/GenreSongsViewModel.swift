//
//  GenreSongsViewModel.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

protocol GenreSongsViewModelDelegate: class {
    func reloadViews()
}

class GenreSongsViewModel {
    
    weak var delegate: GenresViewModelDelegate?
    
    private var genre: Genre
    
    var genreTitle: String {
        return genre.name
    }
    var numberOfSections: Int = 1
    
    var numberOfRows: Int {
        return genre.songs.count
    }
    
    init(genre: Genre) {
        self.genre = genre
    }
    
    func updateData() {
        NetworkDataFetcher.Songs.fetchTopSongs(genre: genre) { songs in
            self.genre.songs = songs
            self.delegate?.reloadViews()
        }
    }
    
    func viewModelForSongCell(atIndex index: Int) -> SongViewModel {
        return SongViewModel(song: genre.songs[index])
    }
    
    
    
    
}
