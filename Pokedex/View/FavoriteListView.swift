//
//  FavoriteListView.swift
//  Pokedex
//
//  Created by ドロケ on 05/08/2022.
//

import SwiftUI
import Kingfisher

struct FavoriteListView: View {
//    @ObservedObject var favoritePokemons = FavoritePokemon()
    @ObservedObject var favoritePokemons: FavoritePokemon
    var viewModel: PokemonViewModel
    
    
    var body: some View {
//        NavigationView {
//        List(favoritePokemons.myList) {
//            pokemon in Text("\(pokemon.name) \(pokemon.id)")
//        }
//        .onDelete(perform: delete)
//        }
        if (favoritePokemons.myList.count == 0) {
            Spacer()
            Text("You haven't added Pokemon into your favorite list")
            Spacer()
        }
        
        NavigationView {
                    List {
                        ForEach(favoritePokemons.myList) { pokemon in
                            NavigationLink(
                                destination: PokemonView(pokemon: pokemon, pokemonViewModel: viewModel, favoritePokemons: favoritePokemons),
                                //                                label: { PokemonCard(pokemon: pokemon, pokemonViewModel: viewModel) }
                                label: {
                                    HStack {
                                        
                                        Text("#\(pokemon.id)")
                                        
                                        Text(pokemon.name.capitalized)
                                        
                                        
                                        Spacer()
                                        
                                        KFImage(URL(string: pokemon.imageUrl))
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                        //                                    .padding([.bottom, .trailing], 8)
                                        
                                        
                                    }
                                    //                                    .navigationBarTitle("")
                                    //                                    .navigationBarHidden(true)
                                }
                            )
                            //                            HStack {
                            //
//                                Text("#\(pokemon.id)")
//
//                                Text(pokemon.name.capitalized)
//
//
//                                Spacer()
//
//                                KFImage(URL(string: pokemon.imageUrl))
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 80, height: 80)
////                                    .padding([.bottom, .trailing], 8)
//
//                            }
                            
                            
                        }
                        .onDelete(perform: delete)
                    }
//                    .navigationTitle("Pokemons")
                }
    }
    
    func delete(at offsets: IndexSet) {
        favoritePokemons.myList.remove(atOffsets: offsets)
        }
}

//struct FavoriteListView_Previews: PreviewProvider {
//    static var previews: some View {
////        FavoriteListView()
//    }
//}
