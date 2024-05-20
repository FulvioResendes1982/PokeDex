import Foundation

struct PokemonList: Decodable {
    var results: [PokemonEntry]
}

struct PokemonEntry: Decodable, Identifiable {
    let id = UUID()
    var name: String
    var url: String
}
