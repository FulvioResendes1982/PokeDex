//
//  Test.swift
//  Pokedex
//
//  Created by ドロケ on 04/08/2022.
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

struct TrainerView: View {
    @Binding public var trainer: String
    
    var body: some View {
        ScrollView {
            ZStack {
                Color(.systemGray6)
                    .edgesIgnoringSafeArea(.all)
                    .offset(y: -100)
                    .padding(.bottom, -100)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .center) {
                        Image("cover")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(12)
                        
                        Image("Author")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 190)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color(.systemGray6),lineWidth: 4))
                            .offset(y: -110)
                            .padding(.bottom, -110)
                            .onTapGesture {
                                if let url = URL(string: info["facebook"]!) {
                                    UIApplication.shared.open(url)
                                }
                            }
                        
                        HStack(alignment: .firstTextBaseline) {
                            Text("Hoang Nguyen")
                                .font(.title)
                                .bold()
                                .padding(.bottom, 1)
                        }
                    }
                    
                    Text("Change your trainer's name:")
                        .padding(.top, 8)
                    
                    HStack(alignment: .bottom) {
                        TextField("Enter your trainer's name", text: $trainer)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .padding(.init(top: 8, leading: 24, bottom: 8, trailing: 24))
                            .background(Color(.systemIndigo))
                            .cornerRadius(4)
                            .padding(.top, -14)
                            .multilineTextAlignment(.center)
                        
                        Button(action: {
                            trainer = ""
                        }, label: { Image(systemName: "clear.fill")
                                .font(.system(size: 40))
                                .foregroundColor(Color(.systemGray2))
                        })
                    }
                    .padding(.bottom, 20)
                    
                    VStack(alignment: .leading) {
                        Text("👨‍💻 Author")
                            .font(.headline)
                            .bold()
                            .padding(.bottom, 1)
                        
                        Text(info["author"]!)
                            .lineLimit(nil)
                            .frame(height: 210)
                            .padding(.bottom, 12)
                        
                        Text("🚀 About this app")
                            .font(.headline)
                            .bold()
                            .padding(.bottom, 1)
                        
                        Text(info["about"]!)
                            .lineLimit(nil)
                            .frame(height: 140)
                            .padding(.bottom, 12)
                        
                        Text("🤔 \"Doroke?\"")
                            .font(.headline)
                            .bold()
                            .padding(.bottom, 1)
                        
                        Text(info["doroke"]!)
                            .lineLimit(nil)
                            .frame(height: 50)
                            .padding(.bottom, 12)
                        
                        Text("🌟 Connecting")
                            .font(.headline)
                            .bold()
                            .padding(.bottom, 1)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Image("github")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .opacity(0.8)
                                
                                Text("Repo for this app")
                                    .underline()
                                    .foregroundColor(.blue)
                                    .padding(.bottom, 1)
                                    .onTapGesture {
                                        if let url = URL(string: info["github"]!) {
                                            UIApplication.shared.open(url)
                                        }
                                    }
                            }
                            
                            HStack {
                                Image("website")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .opacity(0.8)
                                
                                Text("Personal website")
                                    .underline()
                                    .foregroundColor(.blue)
                                    .padding(.bottom, 1)
                                    .onTapGesture {
                                        if let url = URL(string: info["website"]!) {
                                            UIApplication.shared.open(url)
                                        }
                                    }
                            }
                            
                            HStack {
                                Image("linkedin")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .opacity(0.8)
                                
                                Text("Linkedin")
                                    .underline()
                                    .foregroundColor(.blue)
                                    .padding(.bottom, 1)
                                    .onTapGesture {
                                        if let url = URL(string: info["linkedin"]!) {
                                            UIApplication.shared.open(url)
                                        }
                                    }
                            }
                        }
                        .padding(.bottom, 50)
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

var info = [
    "author": "Hi my name is Hoang, some might know me as Brian. This is my very first iOS app I ever made, and I'm already lovin' iOS development 😍. I chose Pokedex as Pokemon was my best childhood game. I remember I would wake up at 6am to train some of my Pokemons before school when I was in elementary school. I hope this app also brings back some good memory if you happen to be a Pokemon fan like me.",
    "about": "This is a full-fledged Pokedex app, built with Swift 5.1 and SwiftUI 3 and targeted at iOS > 15.5. It has all the core functionalities search as search by name, ID or type. You can also add Pokemons to your Favorite List, up to 6 of them (following the original gameplay).",
    "doroke": "\"Doroke\" or 「ドロケ」is my IGN (In Game Name) for most of the games I play.",
    "github": "https://github.com/hoangdesu/Pokemon-iOS",
    "website": "https://hoangdesu.com/",
    "linkedin": "https://www.linkedin.com/in/hoangdesu/",
    "facebook": "https://www.facebook.com/Hoangdayo"
]
