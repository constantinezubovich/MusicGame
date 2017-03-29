//
//  NetworkDataLoadable.swift
//  MusicGame
//
//  Created by Константин Зубович on 28.03.17.
//  Copyright © 2017 Constantine Zubovich. All rights reserved.
//

import Foundation

typealias JSONStandart = [String: Any]

protocol NetworkDataLoadable {
    static func loadData(request: RequestProtocol, completion: @escaping ((Data) -> ()))
}

extension NetworkDataLoadable {
    static func loadData(request: RequestProtocol, completion: @escaping ((Data) -> ())) {
        
        if request.request == nil {
            return
        }
        
        URLSession.shared.dataTask(with: request.request!) { data, response, error in
            
            if error != nil {
                print(error!)
                return
            }
            
            guard let data = data else { return }
            completion(data)
        }.resume()
    }
}
