import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel: PokemonViewModel
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
            .onAppear {
                viewModel.getData() { pokemonEntries in
                    for pokemon in pokemonEntries {
                        self.viewModel.fetchSelectedPokemon(stringUrl: pokemon.url) { selectedPokemon in
                            guard let pokemonSelected = selectedPokemon else { return }
                            self.viewModel.pokemons.append(pokemonSelected)
                        }
                    }
                }
            }
            .searchable(text: $searchText)
            .padding(10)
        }
    }
    
    var status: String {
        var pokeCount = ""
        
        if (viewModel.pokemons.count == 0) {
            return "Loading..."
        } else if (filteredPokemons.count == 0) {
            return "No pokemon found :("
        } else {
            pokeCount = filteredPokemons.count > 1 ? "\(filteredPokemons.count) pokemons" : "\(filteredPokemons.count) pokemon"
            return pokeCount
        }
    }
    
    var filteredPokemons: [Pokemon] {
        return searchText == "" ? viewModel.pokemons : viewModel.pokemons.filter {
            $0.name?.contains(searchText.lowercased()) == true
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView(viewModel: PokemonViewModel(service: Service()))
    }
}
