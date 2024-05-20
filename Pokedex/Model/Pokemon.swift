import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int?
    let name: String?
    let imageUrl: String?
    let height: Int?
    let weight: Int?
    let abilities: [Ability]?
    let baseExperience: Int?
    let moves: [Move]?
    let sprites: Sprites?
    let types: [Types]?
    let stats: [Stats]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl
        case height
        case weight
        case abilities
        case baseExperience = "base_experience"
        case moves
        case sprites
        case types
        case stats
    }
    
    init(id: Int? = nil,
         name: String? = nil,
         imageUrl: String? = nil,
         height: Int? = nil,
         weight: Int? = nil,
         abilities: [Ability]? = nil,
         baseExperience: Int? = nil,
         moves: [Move]? = nil,
         sprites: Sprites? = nil,
         types: [Types]? = nil,
         stats: [Stats]? = nil) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.height = height
        self.weight = weight
        self.abilities = abilities
        self.baseExperience = baseExperience
        self.moves = moves
        self.sprites = sprites
        self.types = types
        self.stats = stats
    }
}

// MARK: - Ability
struct Ability: Codable {
    let ability: Species
    let isHidden: Bool
    let slot: Int

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

// MARK: - Species
struct Species: Codable {
    let name: String
    let url: String
}

// MARK: - Move
struct Move: Codable {
    let move: Species
    let versionGroupDetails: [VersionGroupDetail]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

// MARK: - Sprit
struct Sprites: Codable {
    let frontDefault: String
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

// MARK: - Type
struct Types: Codable {
    let slot: Int
    let type: PokemonType
}

struct PokemonType: Codable {
    let name: String
    let url: String
}

// MARK: - Stats
struct Stats: Codable {
    let stat: Stat
    let baseStat: Int
    
    enum CodingKeys: String, CodingKey {
        case stat
        case baseStat = "base_stat"
    }
}

struct Stat: Codable {
    let name: String
}

// MARK: - VersionGroupDetail
struct VersionGroupDetail: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod, versionGroup: Species

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}
