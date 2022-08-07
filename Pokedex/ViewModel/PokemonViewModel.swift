//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by ドロケ on 02/08/2022.
//

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 1
  Project name: Pokedex
  Author: Nguyen Quoc Hoang
  ID: s3697305
  Created date: 31/07/2022
  Last modified: 07/08/2022
  Acknowledgement:
    - Foundation: https://github.com/TomHuynhSG/SSETContactList
    - Some design ideas: https://github.com/MatheusPires99/pokedex, https://github.com/oskarko/Pokedex
    - Apple Developer: https://developer.apple.com/
*/

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemons = [Pokemon]()
    let apiURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemons()
    }
    
    func fetchPokemons() {
        guard let url = URL(string: apiURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err ) in
            // remove unwanted "null" string from the data
            guard let data = data?.parseData(removeString: "null,") else { return }
            
            // using JSON decoder to decode from data (string) to Swift dictionary, and return an array of Pokemon
            guard let decodedPokemons = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            // reload data on the main thread
            DispatchQueue.main.async {
                self.pokemons = decodedPokemons
            }
        }.resume()
    }
    
    func getBackgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire":
            return .systemRed
        case "poison":
            return .systemBrown
        case "grass":
            return .systemGreen
        case "water":
            return .systemCyan
        case "psychic":
            return .systemPurple
        case "normal":
            return .systemOrange
        case "ground":
            return .systemGray
        case "flying":
            return .systemTeal
        case "fairy":
            return .systemPink
        case "bug":
            return .systemGray2
        case "electric":
            return .systemYellow
        case "rock":
            return .systemGray
        case "fighting":
            return .systemBrown
        default:
            return .systemIndigo
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataString = String(data: self, encoding: .utf8)
        let parsedDataString = dataString?.replacingOccurrences(of: string, with: "").replacingOccurrences(of: "\n", with: " ")
        guard let data = parsedDataString?.data(using: String.Encoding.utf8) else { return nil }
        return data
    }
}

// NOTES: @Published var in ObservableObject
//- concept in declarative or reactive programming in SwiftUI
//- this class stores the model, instance is created in PokedexView
//- created instance is marked with @ObservedObject
//- @Published variable: listen for changes
//- pokemons list start out empty, gets populated with API call, trigger loop to run again and render UI
//- Observable + Published vs Observed: talker and listener
