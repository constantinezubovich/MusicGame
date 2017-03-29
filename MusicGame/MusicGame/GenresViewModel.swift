//
//  GenresViewModel.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

protocol GenresViewModelDelegate: class {
    func reloadViews()
}

class GenresViewModel {
    
    weak var delegate: GenresViewModelDelegate?
    
    private var genres: [Genre] = [Genre]()
    
    var numberOfSections: Int = 1
    var numberOfRows: Int {
        return self.genres.count
    }
    
    func updateData() {
        NetworkDataFetcher.Genres.fetchGenres { genres in
            self.genres = genres.sorted { $0.0.id < $0.1.id }
            self.delegate?.reloadViews()
        }
    }
    
    func viewModelForGenreSongsCell(atIndex index: Int) -> GenreSongsViewModel {
        return GenreSongsViewModel(genre: genres[index])
    }
    
}
