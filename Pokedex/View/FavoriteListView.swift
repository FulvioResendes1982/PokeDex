//
//  FavoriteListView.swift
//  Pokedex
//
//  Created by ドロケ on 05/08/2022.
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
import Kingfisher

struct FavoriteListView: View {
    @ObservedObject var favoritePokemons: FavoritePokemon
    var viewModel: PokemonViewModel
    
    var body: some View {
        if (favoritePokemons.myList.count == 0) {
            VStack(alignment: .center) {
                Text("You haven't added any Pokemon into your favorite list")
                    .padding()
                    .multilineTextAlignment(.center)
                    .offset(y: -50)
            }
        }
        else {
            NavigationView {
                List {
                    ForEach(favoritePokemons.myList) { pokemon in
                        NavigationLink(
                            destination: PokemonView(pokemon: pokemon, pokemonViewModel: viewModel, favoritePokemons: favoritePokemons),
                            label: {
                                HStack {
                                    Text("#\(pokemon.id)")
                                    
                                    Text(pokemon.name.capitalized)
                                    
                                    Spacer()
                                    
                                    KFImage(URL(string: pokemon.imageUrl))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                }
                            }
                        )
                    }
                    .onDelete(perform: delete)
                }
                .navigationTitle("Favorite Pokemons")
                .navigationBarTitleDisplayMode(.inline)
            }
            Text("\(favoritePokemons.myList.count)/6 pokemons")
                .padding(.vertical, 10)
        }
    }
    
    // ACKNOWLEDGED BUG: Deleting the last pokemon form the FavoriteViewList will crash the program
    func delete(at offsets: IndexSet) {
        if favoritePokemons.myList.count > 0 {
            favoritePokemons.myList.remove(atOffsets: offsets)
        } else {
            return
        }
    }
}
