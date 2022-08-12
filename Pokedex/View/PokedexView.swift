//
//  PokedexView.swift
//  Pokedex
//
//  Created by ドロケ on 31/07/2022.
//

/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 1
 Project name: Pokedex
 Author: Nguyen Quoc Hoang
 ID: s3697305
 Created date: 31/07/2022
 Last modified: 07/08/2022
 Acknowledgement:
 - Foundation: https://github.com/TomHuynhSG/SSETContactList
 - Some design ideas: https://github.com/MatheusPires99/pokedex, https://github.com/oskarko/Pokedex
 - Apple Developer: https://developer.apple.com/
 */

import SwiftUI


struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    @ObservedObject var favoritePokemons = FavoritePokemon()
    
    @State private var searchText: String = ""
    @State public var trainer = "Doroke"
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(filteredPokemons) { pokemon in
                        NavigationLink(
                            destination: PokemonView(pokemon: pokemon, pokemonViewModel: viewModel, favoritePokemons: favoritePokemons),
                            label: { PokemonCard(pokemon: pokemon, pokemonViewModel: viewModel) }
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
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
