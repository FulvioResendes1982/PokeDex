import Foundation

public struct PokemonList: Decodable {
    var results: [PokemonEntry]
}

public struct PokemonEntry: Decodable, Identifiable {
    public let id = UUID()
    var name: String
    var url: String
}
