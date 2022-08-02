//
//  Pokemon.swift
//  Pokedex
//
//  Created by ドロケ on 31/07/2022.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    
    let attack: Int
    let defense: Int
    let height: Int
    let weight: Int
}


// Decodable: A type that can decode itself from an external representation.
// it looks at the raw data given back, and automatically match properties with the ones from data

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageUrl: "1", type: "poison", description: "description", attack: 1, defense: 2, height: 3, weight: 4),
    .init(id: 1, name: "Bulbasaur 1", imageUrl: "1", type: "poison", description: "description", attack: 1, defense: 2, height: 3, weight: 4),
    .init(id: 2, name: "Bulbasaur 2", imageUrl: "1", type: "poison", description: "description", attack: 1, defense: 2, height: 3, weight: 4),
    .init(id: 3, name: "Bulbasaur 3", imageUrl: "1", type: "poison", description: "description", attack: 1, defense: 2, height: 3, weight: 4),
    .init(id: 4, name: "Zed", imageUrl: "1", type: "poison", description: "description", attack: 1, defense: 2, height: 3, weight: 4)
]
