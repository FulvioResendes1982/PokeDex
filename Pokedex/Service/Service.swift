//
//  Service.swift
//  Pokedex
//
//  Created by fgrmac on 21/05/24.
//

import Foundation

public protocol ServiceManager {
    func getData(completion: @escaping ([PokemonEntry]) -> ())
    func fetchSelectedPokemon(stringUrl: String, completion: @escaping (Pokemon?) -> ())
}

class Service: ServiceManager {
    func getData(completion: @escaping ([PokemonEntry]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(PokemonList.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
            
        }.resume()
    }
    
    func fetchSelectedPokemon(stringUrl: String, completion: @escaping (Pokemon?) -> ()) {
        guard let url = URL(string: stringUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemon = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemon)
            }
            
        }.resume()
    }
}
