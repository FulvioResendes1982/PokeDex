//
//  PokemonView.swift
//  Pokedex
//
//  Created by ドロケ on 31/07/2022.
//

import SwiftUI
import Kingfisher
import CoreLocation
import MapKit

struct PokemonView: View {
    let pokemon: Pokemon
    var value = 350
    let color: Color = .blue
    
    var body: some View {
        VStack {
            MapView()
            
            Image("1")
//            KFImage(URL(string: pokemon.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding([.bottom, .trailing], 10)
            
            // for testing
//            Image("1")
//                .clipShape(Circle())
//                .overlay(Circle()
//                    .stroke(Color(.white), lineWidth: 4))
//                .shadow(color: .red, radius: 8)
            
            Text("Random: \(Int.random(in: 1..<100))")
            
            Text(pokemon.name.capitalized)
            
            Text(pokemon.description)
            
            Text("\(pokemon.height)")
            Text("\(pokemon.weight)")
            Text("\(pokemon.defense)")
            
            
        }
//        VStack {
//            KFImage(URL(string: pokemon.imageUrl))
//                .resizable()
//                .scaledToFit()
//                .frame(width: 200, height: 200)
//                .padding([.bottom, .trailing], 10)
//
//            Text(pokemon.name.capitalized)
//
//            Text(pokemon.description)
//
//            Text("\(pokemon.height)")
//            Text("\(pokemon.weight)")
//            Text("\(pokemon.defense)")
//
//            ZStack(alignment: .leading) {
//                   Capsule()
//                       .frame(width: 180, height: 20).animation(.default)
//                       .foregroundColor(Color(.systemGray5))
//
//                   Capsule()
//                       .frame(width: value > 250 ? CGFloat(180) : CGFloat(value), height: 20).animation(.default)
//                       .foregroundColor(color)
//               }
//
//        }
//        .padding(10)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemon: MOCK_POKEMON[0])
    }
}
