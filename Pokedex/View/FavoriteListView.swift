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
    
//    @State var counter = 1
    
    var body: some View {
//        NavigationView {
//        List(favoritePokemons.myList) {
//            pokemon in Text("\(pokemon.name) \(pokemon.id)")
//        }
//        .onDelete(perform: delete)
//        }
        if (favoritePokemons.myList.count == 0) {
            VStack(alignment: .center) {
//                Spacer()
                Text("You haven't added any Pokemon into your favorite list")
                    .padding()
//                    .frame(maxWidth: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .offset(y: -50)
//                Spacer()
            }
            
//            Spacer()
        }
        else {
            
            NavigationView {
                List {
                    ForEach(favoritePokemons.myList) { pokemon in
                        NavigationLink(
                            destination: PokemonView(pokemon: pokemon, pokemonViewModel: viewModel, favoritePokemons: favoritePokemons),
                            //                                label: { PokemonCard(pokemon: pokemon, pokemonViewModel: viewModel) }
                            label: {
                                HStack {
                                    
                                    Text("#\(pokemon.id)")
//                                    counter+=1
                                    
//                                    Text(formattedId)
                                    
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
                .navigationTitle("Favorite Pokemons")
//                .navigationBarHidden(true)
                .navigationBarTitleDisplayMode(.inline)
            }
            Text("\(favoritePokemons.myList.count)/6 pokemons")
        }
    }
    
//    var formattedId: String {
//        if pokemon.id / 10 < 1 {
//            return "#00\(pokemon.id)"
//        } else if pokemon.id / 10 < 10 {
//            return "#0\(pokemon.id)"
//        } else {
//            return "#\(pokemon.id)"
//        }
//    }
    
    func delete(at offsets: IndexSet) {
        favoritePokemons.myList.remove(atOffsets: offsets)
        }
}

//struct FavoriteListView_Previews: PreviewProvider {
//    static var previews: some View {
////        FavoriteListView()
//    }
//}
