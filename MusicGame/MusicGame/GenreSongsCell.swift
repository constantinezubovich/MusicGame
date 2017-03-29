//
//  GenreSongsCell.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import UIKit

class GenreSongsCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "GenreSongsCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var genreLabel: UILabel!
    
    var viewModel: GenreSongsViewModel!
    
    override func awakeFromNib() {
        print("awakeFromNib")
        collectionView.dataSource = self
    }
    
    func configure(viewModel: GenreSongsViewModel) {
        self.viewModel = viewModel
        self.viewModel.delegate = self
        genreLabel.text = viewModel.genreTitle
        self.viewModel.updateData()
    }
    
}

extension GenreSongsCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SongCell.reuseIdentifier, for: indexPath) as! SongCell
        cell.configure(viewModel: viewModel.viewModelForSongCell(atIndex: indexPath.row))
        
        return cell
    }
    
}

extension GenreSongsCell: GenresViewModelDelegate {
    func reloadViews() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
