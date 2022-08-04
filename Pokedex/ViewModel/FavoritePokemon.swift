//
//  FavoritePokemon.swift
//  Pokedex
//
//  Created by ドロケ on 05/08/2022.
//

import Foundation

class FavoritePokemon: ObservableObject {
    @Published var myList = [Pokemon]()
}
