
//
//  GenresViewController.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import UIKit

class GenresViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: GenresViewModel = GenresViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        
        viewModel.updateData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension GenresViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreSongsCell.reuseIdentifier, for: indexPath) as! GenreSongsCell
        
        cell.configure(viewModel: viewModel.viewModelForGenreSongsCell(atIndex: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "GenreView", for: indexPath)
        return view
    }
    
    
}

extension GenresViewController: GenresViewModelDelegate {
    func reloadViews() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

