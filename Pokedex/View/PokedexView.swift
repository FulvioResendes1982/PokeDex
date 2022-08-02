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
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.pokemons) { pokemon in
                        PokemonCard(pokemon: pokemon, pokemonViewModel: viewModel)
                    }
                }
                .navigationTitle("Doroke's Pokedex")
                
                Text("\(viewModel.pokemons.count) pokemons")
                    .padding(.top, 20)
            }
        }
        
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
