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
    var value = 350
    let color: Color = .blue
    
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
                                
                                Text(formattedId)
//                                    .font(.subheadline).bold()
//                                    .foregroundColor(.white)
//                                    .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
//                                    .background(Color(pokemonViewModel.getBackgroundColor(forType: pokemon.type)))
//                                    .cornerRadius(20)
////                                    .padding(.top, -12)
                                    .font(.headline).bold()
                                    .foregroundColor(.white)
//                                    .padding(.horizontal, 16)
//                                    .padding(.vertical, 8)
//                                    .overlay(
//                                        RoundedRectangle(cornerRadius: 20)
//                                            .fill(Color.white.opacity(0.25))
//                                    )
//                                    .frame(width: 100, height: 24)
                                    .offset(x: 160, y: -100)
                                
                                if (isInFavoriteList) {
                                    Image("spinningball")
                                        .resizable()
                                        .opacity(0.2)
                                        .frame(width: 230, height: 230)
                                        .foregroundColor(.red)
                                    //                                                .offset(x: -70, y: -60)
                                        .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                                        .animation(self.foreverAnimation)
                                        .onAppear {
                                            self.isAnimating = true
                                        }.onDisappear {
                                            self.isAnimating = false
                                        }
                                        .padding(.top, 20)
                                    
                                    
                                } else {
                                    
                                    Ellipse()
                                        .fill(Color.black)
                                        .frame(width: 190, height: 30)
                                        .offset(y: 105)
                                        .opacity(0.1)
                                }
                                    
                                //
                                //                                Image("pokeball")
                                //                                    .resizable()
                                //                                    .frame(width: 200, height: 200)
                                
                                Button(action: {
                                    if favoritePokemons.myList.count < 6 {
                                        showDialogState = true
                                    }
                                    
                                }) {
                                    KFImage(URL(string: pokemon.imageUrl))
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 200, height: 200)
                                        .padding([.bottom, .trailing], 10)
                                    //                                                .offset(y: -80)
                                    //                                                .padding(.bottom, -80)
                                        .padding(.top, 40)
                                    
                                    
                                }
                                .alert(dialogTitle, isPresented: $showDialogState) {
                                    
                                    if isInFavoriteList {
                                        Button("Remove from my favorite list") {
                                            
                                            
                                            if let index = favoritePokemons.myList.firstIndex(where: { $0.name == pokemon.name }) {
                                                favoritePokemons.myList.remove(at: index)
                                                isInFavoriteList = false
                                            }
                                            
                                        }
                                        
                                    } else {
                                        Button("Add to my favorite list") {
                                            
                                            // can only add max 6 pokemon
                                            if favoritePokemons.myList.count < 6 && !isInFavoriteList {
                                                favoritePokemons.myList.append(pokemon)
                                                isInFavoriteList = true
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
                        
                        VStack {
                            
                            
                            
                            Text(pokemon.name.capitalized)
                                .font(.largeTitle)
                            
                            //                            HStack {
                            
                            //                                Text("#\(pokemon.id)")
                            //                                    .font(.subheadline).bold()
                            //                                    .foregroundColor(.white)
                            //                                    .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
                            //                                    .background(Color(pokemonViewModel.getBackgroundColor(forType: pokemon.type)))
                            //                                    .cornerRadius(20)
                            //                                    .padding(.top, -12)
                            
                            Text(pokemon.type.capitalized)
                                .font(.subheadline).bold()
                                .foregroundColor(.white)
                                .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
                                .background(Color(pokemonViewModel.getBackgroundColor(forType: pokemon.type)))
                                .cornerRadius(20)
                                .padding(.top, -12)
                            //                            }
                            
                            HStack() {
                                Text("Description")
                                    .font(.system(size: 18, weight: .semibold))
//                                    .font(.system())
                                    .padding(.bottom, 8)
                                
                                Spacer()
                            }
                            .padding(.top, 10)
                            
                            Text(formattedDescription)
//                                .padding()
//                                .background(.white)
//                                .cornerRadius(16)
//                                .shadow(color: .gray, radius: 6, x: 0.0, y: 0.0)
                                .padding(0)
                            
                            
                            
                            // TODO: BARCHARTVIEW
//                            ZStack(alignment: .leading) {
//                                Capsule()
//                                    .frame(width: 180, height: 20).animation(.default)
//                                    .foregroundColor(Color(.systemGray5))
//
//                                Capsule()
//                                    .frame(width: CGFloat(120), height: 20).animation(.default)
//                                    .foregroundColor(color)
//                            }
//
//                            ZStack(alignment: .leading) {
//                                Capsule()
//                                    .frame(width: 180, height: 20).animation(.default)
//                                    .foregroundColor(Color(.systemGray5))
//
//                                Capsule()
//                                    .frame(width: CGFloat(170), height: 20).animation(.default)
//                                    .foregroundColor(.red)
//                            }
//
//                            ZStack(alignment: .leading) {
//                                Capsule()
//                                    .frame(width: 180, height: 20).animation(.default)
//                                    .foregroundColor(Color(.systemGray5))
//
//                                Capsule()
//                                    .frame(width: CGFloat(30), height: 20).animation(.default)
//                                    .foregroundColor(.pink)
//                            }
                            
                            StatsViews(pokemon: pokemon)
                            
//                            List {
//                                ForEach(pokemon.evolutionChain) { pokemon in
//                                    Text(pokemon.name)
//                                }
//                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 50)
                        
                            
                        
                        
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
        //        .navigationTitle(pokemon.name.capitalized)
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
    
    var dialogTitle: String {
        if !isInFavoriteList {
            return "I choose you \(pokemon.name.capitalized)!"
        } else {
            return "Goodbye \(pokemon.name.capitalized) :("
        }
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
    
    var formattedDescription: String {
        var description = ""
        for char in pokemon.description {
            if char != "\n" || char != "\0" {
                description += String(char)
            }
        }
        return description
    }
    
    
    
}

//struct PokemonView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonView(pokemon: MOCK_POKEMON[0])
//    }
//}

struct StatsViews: View {
    let pokemon: Pokemon
    

    var body: some View {
        HStack {
            Text("Stats")
                .font(.system(size: 18, weight: .semibold))
//                                    .font(.system())
                .padding(.bottom, 8)
            
            Spacer()
        }
        .padding(.top, 10)
        
        VStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("Height")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .bold()
                        .padding(.bottom, 2)
                    
                    
                    Text("\(heightToString)")
                    
                        .bold()
                    
                }
                .padding(.vertical, 25)
                .padding(.leading, 20)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Weight")
                        .font(.system(size: 15))
                        .foregroundColor(.gray)
                        .bold()
                        .padding(.bottom, 2)
                    
                    Text("\(weightToString)")
                        .bold()
                    
                }
                //                .padding()
                
                .padding(.horizontal, 20)
                .padding(.vertical, 25)
            }
            
            .background(.white)
            .cornerRadius(16)
            .shadow(color: .gray, radius: 5, x: 0.0, y: 1.0)
            
            
            // attack
            
                BarChartView(pokemon: pokemon, attribute: "attack")
            
            
            // defense
            
                //                Text("Bars...")
            BarChartView(pokemon: pokemon, attribute: "defense")
            
        }
        
        
        
    }
    
    var heightToString: String {
        let m = (Double(pokemon.height) / 10.0)
        let ft = m * 3.281
        return String(format: "%.2f m (%.2f ft)", m, ft)
    }
    
    
    var weightToString: String {
        let kg = (Double(pokemon.weight) / 10.0)
        let lbs = kg * 2.205
        return String(format: "%.2f kg (%.2f lbs)", kg, lbs)
    }
}

struct BarChartView: View {
    let pokemon: Pokemon
    let attribute: String
    
    let capsuleWidth = CGFloat(200)
    let capsuleHeight = CGFloat(10)
    
    var body: some View {
        HStack {
            Text(attribute.capitalized)
            
            Text("\(value)")
            
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: capsuleWidth, height: capsuleHeight)
                    .foregroundColor(Color(.systemGray5))
                
                Capsule()
                    .frame(width: barChartValue, height: capsuleHeight) //.animation(.default)
                    .foregroundColor(attribute == "attack" ? .red : .blue)
            }
        }
    }
    
    var value: String {
        var val: Int
        
        if attribute == "attack" {
            val = pokemon.attack
        } else if attribute == "defense" {
            val = pokemon.defense
        } else {
            val = 0
        }
        
        return "\(val)"
    }
    
    var barChartValue: CGFloat {
        let MAX_VALUE = 120.0
        
        var val = Double(value)!
        if val > 120 {
            val = 120
        }
        
        return CGFloat(val / MAX_VALUE * capsuleWidth)
    }
}
