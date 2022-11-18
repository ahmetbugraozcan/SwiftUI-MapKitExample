//
//  MapKitView.swift
//  MapKitExample
//
//  Created by Ahmet Buğra Özcan on 18.11.2022.
//

import SwiftUI
import MapKit

struct MapKitView: View {
    var place: LocalSearchViewData
    @State private var region: MKCoordinateRegion
    init(place: LocalSearchViewData) {
        self.place = place
      
        _region = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)))
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

//struct MapKitView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        MapKitView()
//    }
//}
