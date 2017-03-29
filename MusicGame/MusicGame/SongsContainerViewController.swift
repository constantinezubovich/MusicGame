//
//  SongsContainerViewController.swift
//  MusicGame
//
//  Created by Constantine on 29.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation
import UIKit

class SongsContainerViewController: ContainerViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    fileprivate lazy var genresViewCOntroller: GenresViewController = UIStoryboard(name: "iTunesGame", bundle: nil).instantiateViewController(withIdentifier: "GenresViewController") as! GenresViewController
    fileprivate lazy var searchSongsViewController: SearchSongsViewController = UIStoryboard(name: "iTunesGame", bundle: nil).instantiateViewController(withIdentifier: "SearchSongsViewController") as! SearchSongsViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
}

extension SongsContainerViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        self.searchBar.setShowsCancelButton(true, animated: true)
        loadChildViewController(vc: searchSongsViewController)
        return true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchSongsViewController.viewModel.searchSongs(searchText: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        loadChildViewController(vc: genresViewCOntroller)
    }
    
}

