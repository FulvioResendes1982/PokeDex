//
//  Test.swift
//  Pokedex
//
//  Created by ドロケ on 04/08/2022.
//

import SwiftUI



struct TrainerView: View {
    @Binding public var trainer: String
    
    var body: some View {
        ScrollView {
            ZStack {
                
//                ColorConstants.rmitBlue
                Color(.systemGray6)
                            .edgesIgnoringSafeArea(.all)
                            .offset(y: -100)
                            .padding(.bottom, -100)
//                    .edgesIgnoringSafeArea(.all)
                
                    
                
                
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .center) {
                        Image("cover")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(12)
    //

                        Image("Author")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 190)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color(.white),lineWidth: 4))
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
                            
//                            Text("(Brian)")
//                                .font(.system(size: 20))
                                
                        }
                        
                        
                    }
                    
                    
                    
//                    Text("Doroke")
//                        .padding()
                    
                    
                    
                    Text("Change your trainer's name:")
                        .padding(.top, 8)
                    
                    HStack(alignment: .bottom) {
                        
                        TextField("Enter your trainer's name", text: $trainer)
                        //                        .font(.subheadline).bold()
                        //                        .foregroundColor(.white)
                        
                        //                        .padding(.horizontal, 16)
                        //                        .padding(.vertical, 8)
                        //                        .overlay(
                        //                            RoundedRectangle(cornerRadius: 20)
                        //                                .fill(Color.white.opacity(0.25))
                        //                        )
                        //                        .frame(width: 100, height: 24)
                        //                        .font(.subheadline)
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
                        
                        Text("🚀 About")
                            .font(.headline)
                            .bold()
                            .padding(.bottom, 1)
                        
                        Text(info["about"]!)
                            .lineLimit(nil)
                            .frame(height: 210)
                            .padding(.bottom, 12)
                        
                        Text("🤔 \"Doroke?\"")
                            .font(.headline)
                            .bold()
                            .padding(.bottom, 1)
                        
                        Text(info["doroke"]!)
                            .lineLimit(nil)
                            .frame(height: 50)
                            .padding(.bottom, 12)
                            
                        
                        Text("👨‍💻 Connecting")
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
//            .foregroundColor(.white)
            
            .navigationBarTitleDisplayMode(.inline)
            
            
            
//            ZStack {
//                    ColorConstants.rmitBlue
//                        .edgesIgnoringSafeArea(.bottom)
//                    ScrollView {
//
//                            VStack {
//                                MapView(coordinate: contact.locationCoordinate)
//                                    .edgesIgnoringSafeArea(.top)
//                                    .frame(height: 250)
//                                CircleImage(image: contact.image)
//                                    .offset(y: -100)
//                                    .padding(.bottom, -100)
//                                Text(contact.name)
//                                    .font(.system(size: 40))
//                                    .bold()
//                                .foregroundColor(.white)
//                                Image("rmit-logo-white").resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height: 65)
//                                    .padding(.bottom, 5)
//
//                                InfoView(text: contact.email, url:"mailto:\(contact.email)" , imageName: "envelope.fill")
//                                InfoView(text: contact.phone, url:"tel:\(contact.phone)", imageName: "phone.fill")
//
//                            }
//                        }
//                    }
//                    .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct Test_Previews: PreviewProvider {
//    @Binding public var trainer: String
//    static var previews: some View {
//        TrainerView(trainer: $trainer)
//    }
//}

var info = [
    "about": "Hi my name is Hoang, some might know me as Brian. This is my very first iOS app I ever made, and I'm already lovin' iOS development 😍. I chose Pokedex as Pokemon was my best childhood game. I remember I would wake up at 6am to train some of my Pokemons before school when I was in elementary. I hope this app also brings back some good memory if you happen to be a Pokemon fan like me.",
    "doroke": "\"Doroke\" is my IGN (In Game Name) for most of the games I play.",
    "github": "https://github.com/hoangdesu/Pokemon-iOS",
    "website": "https://hoangdesu.com/",
    "linkedin": "https://www.linkedin.com/in/hoangdesu/",
    "facebook": "https://www.facebook.com/Hoangdayo"
]
