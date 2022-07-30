//
//  PokedexView.swift
//  Pokedex
//
//  Created by ドロケ on 31/07/2022.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(0..<MOCK_POKEMON.count) { i in
                        PokemonCard(pokemon: MOCK_POKEMON[i])
                    }
                }
            }
            .navigationTitle("Doroke's Pokedex")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
