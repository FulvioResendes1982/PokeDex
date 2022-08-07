//
//  MapView.swift
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
import MapKit
import Kingfisher

let vietnam = CLLocationCoordinate2D(latitude: 14.0626, longitude: 105.6601)

struct MapView: View {
    let pokemon: Pokemon
    
    @State private var region = MKCoordinateRegion(
        center: vietnam,
        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
    )
    
    @State var randomCities: [City] = [
        cities.randomElement()!,
        cities.randomElement()!,
        cities.randomElement()!,
        cities.randomElement()!,
        cities.randomElement()!,
    ]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: randomCities) {
            MapAnnotation(coordinate: $0.coordinate) {
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color(.white), lineWidth: 1))
                    .shadow(color: .red, radius: 4)
                    .frame(width: 30, height: 30)
            }
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        )
    }
}
