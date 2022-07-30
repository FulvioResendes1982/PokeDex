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
}

let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageUrl: "1", type: "poison"),
    .init(id: 1, name: "Bulbasaur 1", imageUrl: "1", type: "poison"),
    .init(id: 2, name: "Bulbasaur 2", imageUrl: "1", type: "poison"),
    .init(id: 3, name: "Bulbasaur 3", imageUrl: "1", type: "poison"),
]
