//
//  PokemonView.swift
//  Pokedex
//
//  Created by ドロケ on 31/07/2022.
//

import SwiftUI
import Kingfisher

struct PokemonView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            KFImage(URL(string: pokemon.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding([.bottom, .trailing], 10)
            
            Text(pokemon.name.capitalized)
            
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: MOCK_POKEMON[0])
    }
}
