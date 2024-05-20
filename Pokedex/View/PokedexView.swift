import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State var pokemonEntries = [PokemonEntry]()
    
    @ObservedObject var viewModel = PokemonViewModel()
    @ObservedObject var favoritePokemons = FavoritePokemon()
    
    @State private var searchText: String = ""
    @State public var trainer = "Fulvio"
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(filteredPokemons) { selectedPokemon in
                        NavigationLink(
                            destination: PokemonView(pokemon: selectedPokemon, pokemonViewModel: viewModel, favoritePokemons: favoritePokemons),
                            label: { PokemonCard(pokemon: selectedPokemon, viewModel: viewModel) }
                        )
                    }
                }

                Text(status)
                    .padding(.vertical, 15)
                    .navigationTitle("\(trainer)'s Pokedex")
                    .navigationBarItems(leading: NavigationLink(
                        destination: FavoriteListView(favoritePokemons: favoritePokemons, viewModel: viewModel),
                        label: { Image("pokeball")
                                .resizable()
                                .frame(width: 30, height: 30)

                        }), trailing: NavigationLink(
                            destination: TrainerView(trainer: $trainer),
                            label: { Image("user")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            })
                    )
            }
            .searchable(text: $searchText)
            .padding(10)
        }
    }
    
    var status: String {
        var pokeCount = ""
        
        if (viewModel.pokemonEntries.count == 0) {
            return "Loading..."
        } else if (filteredPokemons.count == 0) {
            return "No pokemon found :("
        } else {
            pokeCount = filteredPokemons.count > 1 ? "\(filteredPokemons.count) pokemons" : "\(filteredPokemons.count) pokemon"
            return pokeCount
        }
    }
    
    var filteredPokemons: [Pokemon] {
        var filteredList: [Pokemon] = []
        
        // search by name or id
        for pokemon in viewModel.pokemons {
            if ((pokemon.name?.contains(searchText.lowercased())) != nil) {
                filteredList.append(pokemon)
            } else if "\(pokemon.id ?? 0)" == searchText {
                filteredList.append(pokemon)
            }
        }
        return searchText == "" ? viewModel.pokemons : filteredList
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
