import XCTest
@testable import Pokedex

class PokedexTests: XCTestCase {
    
    var sut: PokemonViewModel!
    var mockService: ServiceManager = MockService()

    override func setUp() async throws {
        try await super.setUp()
        sut = PokemonViewModel(service: mockService)
    }
    
    func testgetData() {
        sut.getData() { pokemonResult in
            XCTAssertEqual(pokemonResult.first?.name, "Bola")
        }
    }

}
