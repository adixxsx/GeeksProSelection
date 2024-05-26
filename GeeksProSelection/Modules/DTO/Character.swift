//
//  Character.swift
//  GeeksProSelection
//
//  Created by user on 25/5/24.
//

import Foundation

struct Character: Decodable {
    let id: Int
    let name: String
    let status: String
    let image: String
}

struct CharacterResponse: Decodable {
    let results: [Character]
}

