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
    var favoritePokemons: FavoritePokemon
    
    
    var body: some View {
//        NavigationView {
//        List(favoritePokemons.myList) {
//            pokemon in Text("\(pokemon.name) \(pokemon.id)")
//        }
//        .onDelete(perform: delete)
//        }
        
        NavigationView {
                    List {
                        ForEach(favoritePokemons.myList) { pokemon in
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
