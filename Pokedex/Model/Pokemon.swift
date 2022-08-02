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

// Decodable: A type that can decode itself from an external representation.
// it looks at the raw data given back, and automatically match properties with the ones from data


let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur", imageUrl: "1", type: "poison"),
    .init(id: 1, name: "Bulbasaur 1", imageUrl: "1", type: "poison"),
    .init(id: 2, name: "Bulbasaur 2", imageUrl: "1", type: "poison"),
    .init(id: 3, name: "Bulbasaur 3", imageUrl: "1", type: "poison"),
    .init(id: 4, name: "Zed", imageUrl: "1", type: "poison"),
    .init(id: 5, name: "pqoweipqie 1", imageUrl: "1", type: "poison"),
    .init(id: 6, name: "lkjlk 2", imageUrl: "1", type: "poison"),
    .init(id: 7, name: "asdlkad 3", imageUrl: "1", type: "poison"),
    .init(id: 8, name: "asd", imageUrl: "1", type: "poison"),
    .init(id: 9, name: "oh wow 1", imageUrl: "1", type: "poison"),
    .init(id: 10, name: "haha 2", imageUrl: "1", type: "poison"),
    .init(id: 11, name: "something  3", imageUrl: "1", type: "poison"),
]
