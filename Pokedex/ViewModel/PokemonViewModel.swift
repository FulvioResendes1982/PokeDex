import SwiftUI
import Foundation
import Combine

class PokemonViewModel: ObservableObject {
    @Published var pokemonEntries: [PokemonEntry] = []
    @Published var pokemon = Pokemon()
    @Published var pokemons: [Pokemon] = []

    private var cancellable: AnyCancellable?

    init() {
        getData() { pokemonEntries in
            self.pokemonEntries = pokemonEntries
            
            for pokemon in pokemonEntries {
                self.fetchSelectedPokemon(stringUrl: pokemon.url) { selectedPokemon in
                    guard let pokemonSelected = selectedPokemon else { return }
                    self.pokemons.append(pokemonSelected)
                }
            }
        }
    }
    
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
            return .systemRed
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
