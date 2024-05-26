//
//  NetworkManager.swift
//  GeeksProSelection
//
//  Created by user on 25/5/24.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func fetchCharacters(completion: @escaping ([Character]?) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching characters: \(error)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                let characterResponse = try JSONDecoder().decode(CharacterResponse.self, from: data)
                completion(characterResponse.results)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }
        
        task.resume()
    }
}

