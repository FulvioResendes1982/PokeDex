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
                .frame(width: 200, height: 200)
                .padding([.bottom, .trailing], 10)
            
            Text(pokemon.name.capitalized)
            
            Text(pokemon.description)
            
            Text("\(pokemon.height)")
            Text("\(pokemon.weight)")
            Text("\(pokemon.defense)")
            
            
        }
        .padding(10)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: MOCK_POKEMON[0])
    }
}
