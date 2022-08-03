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
        center: CLLocationCoordinate2D(latitude: 16.5626, longitude: 105.6601),
        span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15))
    
//    @State private var text: CLLocationCoordinate2D
    
    @State var showDescription = false
    
    let annotations = [
        City(name: "Ho Chi Minh city", coordinate: CLLocationCoordinate2D(latitude: 10.836, longitude: 106.650)),
        City(name: "Dalat", coordinate: CLLocationCoordinate2D(latitude: 11.944875531315308, longitude: 108.42520976525859)),
        City(name: "Da Nang", coordinate: CLLocationCoordinate2D(latitude: 16.03023352196046, longitude: 108.18158667392687)),
        City(name: "Ha Noi", coordinate: CLLocationCoordinate2D(latitude: 21.04391576875771, longitude: 105.7975599458177))
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
                    
                    .clipShape(Circle())
                    .overlay(Circle()
                        .stroke(Color(.white), lineWidth: 1))
                    .shadow(color: .red, radius: 4)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        self.showDescription.toggle()
                    }
                
                if showDescription {
                    Text($0.coordinate)
                }
                
            }
            
                
        }
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
