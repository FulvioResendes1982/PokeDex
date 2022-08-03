//
//  MapView.swift
//  Pokedex
//
//  Created by ドロケ on 04/08/2022.
//

import SwiftUI
import MapKit

struct City: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
//    var coordinate: CLLocationCoordinate2D
    
//    @State private var region = MKCoordinateRegion()
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 10.762622, longitude: 106.6601), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
    
    let annotations = [
        City(name: "London", coordinate: CLLocationCoordinate2D(latitude: 10.872622, longitude: 106.890172)),
        City(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 10.982622, longitude: 106.680172)),
        City(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 10.152622, longitude: 106.770172)),
        City(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 10.792622, longitude: 107.661172))
    ]

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: annotations) {
//            MapPin(coordinate: $0.coordinate)
            MapAnnotation(coordinate: $0.coordinate) {
//                Circle()
//                    .strokeBorder(.red, lineWidth: 4)
//                    .frame(width: 40, height: 40)
                Image("1")
                    .resizable()
                    .scaledToFit()
                    
//                    .clipShape(Circle())
//                    .overlay(Circle()
//                        .stroke(Color(.white), lineWidth: 1))
                    .shadow(color: .red, radius: 4)
                    .frame(width: 30, height: 30)
                
            }
            
                
        }
        .frame(width: 400, height: 300)
//            .onAppear {
//                setRegion(coordinate)
//            }
    }
    
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
        MapView()
    }
}

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-show-annotations-in-a-map-view
