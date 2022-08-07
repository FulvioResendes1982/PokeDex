//
//  PokemonCard.swift
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
import Kingfisher

struct PokemonCard: View {
    let pokemon: Pokemon
    let pokemonViewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemon: Pokemon, pokemonViewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.pokemonViewModel = pokemonViewModel
        self.backgroundColor = Color(pokemonViewModel.getBackgroundColor(forType: pokemon.type))
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.leading)
                    
                    Text(formattedId)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.leading, 2)
                }
                
                HStack {
                    Text(pokemon.type.capitalized)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)

                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .padding([.bottom, .trailing], 8)
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: backgroundColor, radius: 4, x: 1.0, y: 1.0)
    }
    
    var formattedId: String {
        if pokemon.id / 10 < 1 {
            return "#00\(pokemon.id)"
        } else if pokemon.id / 10 < 10 {
            return "#0\(pokemon.id)"
        } else {
            return "#\(pokemon.id)"
        }
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard(pokemon: MOCK_POKEMON[0], pokemonViewModel: PokemonViewModel())
    }
}
