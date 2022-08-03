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
        

//
//            Color(red: 0.1, green: 0.93, blue: 0.95)
//                .edgesIgnoringSafeArea(.top)
//            LinearGradient(gradient: Gradient(colors: [Color(.yellow), Color.white]), startPoint: .top, endPoint: .bottom)
//                            .ignoresSafeArea()
//
//                            Color.white.offset(y: 300)
            
        ScrollView {
            
            VStack {
                MapView(pokemon: pokemon)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 350)
                
                
                    
//                    LinearGradient(gradient: Gradient(colors: [Color(.yellow), Color.white]), startPoint: .top, endPoint: .bottom)
//                                                                        .ignoresSafeArea()
                    
//                                                                        Color.white.offset(y: 300)
                    VStack {
                        
                        HStack {
                            
                            Spacer()
                        
                        //                    Image("1")
                        KFImage(URL(string: pokemon.imageUrl))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                            .padding([.bottom, .trailing], 10)
//                                                .offset(y: -80)
//                                                .padding(.bottom, -80)
                            
                         Spacer()
                        }
                        
                        // for testing
                        //            Image("1")
                        //                    KFImage(URL(string: pokemon.imageUrl))
                        //                                    .clipShape(Circle())
                        //                                    .overlay(Circle()
                        //                                        .stroke(Color(.white), lineWidth: 4))
                        //                                    .shadow(color: .red, radius: 8)
                        //                                    .offset(y: -100)
                        //                                    .padding(.bottom, -100)
                        
                        Text("Random: \(Int.random(in: 1..<100))")
                        
                        Text(pokemon.name.capitalized)
                        
                        Text(pokemon.description)
                        
                        Text("\(pokemon.height)")
                        Text("\(pokemon.weight)")
                        Text("\(pokemon.defense)")
                        
                        Group {
                            Text("Haha")
                            
                        }
                        
                        //                    HStack { Spacer() }
                    }
                    .background(.white)
                    .cornerRadius(40)
                    .padding(.top, -100)
////                    .zIndex(1)
//                    .frame(width: 440)
                    
                   
                    
                
            }
        }
        .navigationTitle(pokemon.name.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        
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
