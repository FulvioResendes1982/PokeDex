//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by ドロケ on 02/08/2022.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [Pokemon]()
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
            guard let decodedPokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            // reload data on the main thread
            DispatchQueue.main.async {
                self.pokemon = decodedPokemon
            }
        }.resume()
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataString = String(data: self, encoding: .utf8)
        let parsedDataString = dataString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: String.Encoding.utf8) else { return nil }
        return data
    }
}
