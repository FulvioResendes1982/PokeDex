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
    
    @State var favoritePokemons: FavoritePokemon
//    var value = 350
//    let color: Color = .blue
    
    let backgroundColor: Color
    
    @State var pokemonViewModel: PokemonViewModel
    
    
    @State private var showDialogState = false
    
    @State private var isInFavoriteList: Bool
    
    @State var angle: Double = 0.0
    @State var isAnimating = false
    
    init(pokemon: Pokemon, pokemonViewModel: PokemonViewModel, favoritePokemons: FavoritePokemon) {
        self.pokemon = pokemon
        self.pokemonViewModel = pokemonViewModel
        self.backgroundColor = Color(pokemonViewModel.getBackgroundColor(forType: pokemon.type))
        self.favoritePokemons = favoritePokemons
        self.isInFavoriteList = favoritePokemons.myList.contains(where: { $0.name == pokemon.name })
    }
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 4.0)
            .repeatForever(autoreverses: false)
    }


    
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
                
                        
                        ZStack {
                            // simply remove this line for clean white background
                            LinearGradient(gradient: Gradient(colors: [self.backgroundColor, Color.white]), startPoint: .top, endPoint: .center)
                                
                                                                                .ignoresSafeArea()

                            VStack {
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    
                                    ZStack {
                                        //                                Circle()
                                        
                                        if (favoritePokemons.myList.contains(where: { $0.name == pokemon.name })) {
                                            Image("ball")
                                                .resizable()
                                                .opacity(0.2)
                                                .frame(width: 230, height: 230)
                                                .foregroundColor(.red)
                                            //                                                .offset(x: -70, y: -60)
                                                .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                                                .animation(   self.foreverAnimation)
                                                .onAppear {
                                                    self.isAnimating = true
                                                }

                                                
                                        } else {
                                        
                                            Ellipse()
                                                .fill(Color.black)
                                                .frame(width: 190, height: 30)
                                                .offset(y: 100)
                                                .opacity(0.1)
                                        }
                                        //
                                        //                                Image("pokeball")
                                        //                                    .resizable()
                                        //                                    .frame(width: 200, height: 200)
                                        
                                        Button(action: {
                                            showDialogState = true
                                        }) {
                                            KFImage(URL(string: pokemon.imageUrl))
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 200, height: 200)
                                                .padding([.bottom, .trailing], 10)
                                            //                                                .offset(y: -80)
                                            //                                                .padding(.bottom, -80)
                                                .padding(.top, 20)
                                            
                                            
                                        }
                                        .alert("I choose you \(pokemon.name.capitalized)!", isPresented: $showDialogState) {
                                           
                                            if isInFavoriteList {
                                                Button("Remove from Pokedex") {
                                                    
                                                   
                                                    if let index = favoritePokemons.myList.firstIndex(where: { $0.name == pokemon.name }) {
                                                        favoritePokemons.myList.remove(at: index)
                                                        
                                                    }
                                                    
                                                }
                                                
                                            } else {
                                                Button("Add to Pokedex") {
                                                    
                                                    // can only add max 6 pokemon
                                                    if favoritePokemons.myList.count < 6 && !isInFavoriteList {
                                                        favoritePokemons.myList.append(pokemon)
                                                    }
                                                    
                                                }
                                                
                                            }
                                            
                                            
                                            Button("Cancel", role: .cancel) {}
                                        }
                                        
                                       
                                        
                                        
                                    }
                                    .padding(.top, 10)
                                    
                                    
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
                                
                                
                                
                                Text(pokemon.name.capitalized)
                                    .font(.system(size: 30))
                                    .bold()
                                
                                Text(pokemon.description)
                                
                                Text("\(pokemon.height)")
                                Text("\(pokemon.weight)")
                                Text("\(pokemon.defense)")
                                
                                Group {
                                    Text("Haha")
                                    Text(pokemon.description)
                                    Text(pokemon.description)
                                    Text(pokemon.description)
                                    Text(pokemon.description)
                                    Text(pokemon.description)
                                    Text(pokemon.description)
                                    Text(pokemon.description)
                                    Text(pokemon.description)
                                    
                                }
                                
                                //                    HStack { Spacer() }
                            }
                        }
                        .background(.white)
                        .cornerRadius(40)
                        .padding(.top, -100)
                        .zIndex(1)
                //                    .frame(width: 440)
                //                }
                
                
                
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

//struct PokemonView_Previews: PreviewProvider {
//    static var previews: some View {
////        PokemonView(pokemon: MOCK_POKEMON[0])
//    }
//}
