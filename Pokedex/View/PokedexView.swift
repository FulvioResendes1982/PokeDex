//
//  PokedexView.swift
//  Pokedex
//
//  Created by ドロケ on 31/07/2022.
//

import SwiftUI


struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
    @State private var searchText: String = ""
    
    @ObservedObject var favoritePokemons = FavoritePokemon()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(filteredPokemons) { pokemon in
                        NavigationLink(
                            destination: PokemonView(pokemon: pokemon, pokemonViewModel: viewModel, favoritePokemons: favoritePokemons),
                            label: { PokemonCard(pokemon: pokemon, pokemonViewModel: viewModel) }
                        )
                        
                        // another way to write (pretty neat too)
                        //                        NavigationLink {
                        //                            PokemonView(pokemon: pokemon)
                        //                        } label: {
                        //                            PokemonCard(pokemon: pokemon, pokemonViewModel: viewModel)
                        //                        }
                    }
                    
                    
                }
                Text(status)
                    .padding(.vertical, 15)
                    .navigationTitle("Doroke's Pokedex")
                    .navigationBarItems(leading: NavigationLink(
                        destination: FavoriteListView(favoritePokemons: favoritePokemons, viewModel: viewModel),
//                        label: { Image(systemName: "heart.fill").imageScale(.large).foregroundColor(.red) }
                        label: { Image("pokeball")
                                .resizable()
                                .frame(width: 25, height: 25)
                                
                                
                        }
                    ),
                                        trailing: NavigationLink(
                                            destination: Test(),
                                            label: { Image(systemName: "person.crop.circle").imageScale(.large) }
                                        ))
                //                    .navigationBarItems(leading:
                //                                            NavigationLink(
                //                                                destination: Test(),
                //                                                label: { Image(systemName: "person.crop.circle").imageScale(.large) }
                //                                            ), trailing: Button(action: {
                //                                                print("Reload button pressed...")
                //                                            }) {
                //                                                Text("Author")
                //                                            }
                //                    )
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
        var filteredList: [Pokemon] = []
        
        // search by name or id or type
        for pokemon in viewModel.pokemons {
            if pokemon.name.contains(searchText.lowercased()) {
                filteredList.append(pokemon)
            } else if "\(pokemon.id)" == searchText {
                filteredList.append(pokemon)
            } else if "\(pokemon.type)" == searchText.lowercased() {
                filteredList.append(pokemon)
            }
        }
        
        return searchText == "" ? viewModel.pokemons : filteredList

//        return searchText == "" ? viewModel.pokemons : viewModel.pokemons.filter {
//            $0.name.contains(searchText.lowercased())
//        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
