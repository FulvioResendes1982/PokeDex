//
//  MapView.swift
//  Pokedex
//
//  Created by ドロケ on 04/08/2022.
//

import SwiftUI
import MapKit
import Kingfisher

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

let cities = [
    City(name: "Ho Chi Minh city", coordinate: CLLocationCoordinate2D(latitude: 10.836, longitude: 106.650)),
    City(name: "Dalat", coordinate: CLLocationCoordinate2D(latitude: 11.944875531315308, longitude: 108.42520976525859)),
    City(name: "Da Nang", coordinate: CLLocationCoordinate2D(latitude: 16.03023352196046, longitude: 108.18158667392687)),
    City(name: "Ha Noi", coordinate: CLLocationCoordinate2D(latitude: 21.04391576875771, longitude: 105.7975599458177)),
    City(name: "Phu Quoc", coordinate: CLLocationCoordinate2D(latitude: 10.290710777678678, longitude: 103.9767996322775)),
    City(name: "Vinh", coordinate: CLLocationCoordinate2D(latitude: 18.654432713917572, longitude: 105.62354329933275)),
    City(name: "Hue", coordinate: CLLocationCoordinate2D(latitude: 16.46460588744961, longitude: 107.57252870216752)),
    City(name: "Nha Trang", coordinate: CLLocationCoordinate2D(latitude: 213.709406626307086, longitude: 109.1734809902859)),
    City(name: "Can Tho", coordinate: CLLocationCoordinate2D(latitude: 10.072578245922982, longitude: 105.71333114297522)),
    City(name: "Pleiku", coordinate: CLLocationCoordinate2D(latitude: 13.985830886801692, longitude: 107.99486303805043)),
    City(name: "Lao Cai", coordinate: CLLocationCoordinate2D(latitude: 22.397690878430346, longitude: 104.07438986271714)),
    City(name: "Hai Phong", coordinate: CLLocationCoordinate2D(latitude: 20.834369242326616, longitude: 106.65764731824288))
]

let vietnam = CLLocationCoordinate2D(latitude: 14.0626, longitude: 105.6601)

struct MapView: View {
//    var coordinate: CLLocationCoordinate2D
    
    //    @State private var region = MKCoordinateRegion()
    
    let pokemon: Pokemon
    
    
    @State private var region = MKCoordinateRegion(
        center: vietnam,
        span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20))
    
//    @State private var text: CLLocationCoordinate2D
    
//    @State var showDescription = false
    
    let randomCities = [
        cities.randomElement()!,
        cities.randomElement()!,
        cities.randomElement()!,
        cities.randomElement()!,
        cities.randomElement()!,
    ]
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: randomCities) {
//            MapPin(coordinate: $0.coordinate)
            MapAnnotation(coordinate: $0.coordinate) {
//                Circle()
//                    .strokeBorder(.red, lineWidth: 4)
//                    .frame(width: 40, height: 40)
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color(.white), lineWidth: 1))
                    .shadow(color: .red, radius: 4)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
//                        self.showDescription.toggle()
                        print(randomCities)
                    }
                
//                if showDescription {
//                    Text($0.coordinate)
//                }
                
            }
            
                
        }
//            .onAppear {
//                setRegion(coordinate)
//            }
    }
    
//    var randomCities: [City] {
//        var randCities: [City] = []
//
//        for _ in 0..<3 {
//            randCities.append(cities.randomElement()!)
//        }
//
//        return randCities
//
//    }
    
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.004, longitudeDelta: 0.004)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
//        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
        MapView(pokemon: MOCK_POKEMON[0])
    }
}




// https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-annotations-in-a-map-view
