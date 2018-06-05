//
//  APIService.swift
//  StarWarsCharacters
//
//  Created by Mitch Praag on 6/5/18.
//  Copyright © 2018 Mitch Praag. All rights reserved.
//

import UIKit

class APIService: NSObject {
    
    enum Result <T>{
        case Success(T)
        case Error(String)
    }
    
    
    func getDataWith(completion: @escaping (Result<[[String: AnyObject]]>) -> Void) {
        guard let url = URL(string: "https://starwarstest16.herokuapp.com/api/characters") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    
                    guard let charactersJsonArray = json["individuals"] as? [[String: AnyObject]] else {  return  }

                    
                    
                    
                    DispatchQueue.main.async {
                        completion(.Success(charactersJsonArray))
                    }
                }
            } catch let error {
                print(error)
            }
            }.resume()
        
        
        
        
        
    }
    
    
    
    

}
