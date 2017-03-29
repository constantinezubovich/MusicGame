//
//  String+MG.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

extension String {
    func resizedImageString() -> String {
        
        let regexp = "[0-9]{2}x[0-9]{2}bb"
        
        if let range = self.range(of:regexp, options: .regularExpression) {
            return self.replacingCharacters(in: range, with: "200x200bb")
        }
        
        return ""
    }
    
    func stringWithSpecialCharactersChanging() -> String {
        return self.replacingOccurrences(of: "&", with: "%26")
    }
}
