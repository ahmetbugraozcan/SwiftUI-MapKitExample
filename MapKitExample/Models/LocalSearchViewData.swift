//
//  LocalSearchViewData.swift
//  MapKitExample
//
//  Created by Ahmet Buğra Özcan on 18.11.2022.
//

import Foundation
import MapKit

struct LocalSearchViewData: Identifiable{
    var id = UUID()
    var title: String
    var subtitle: String
    var latitude: CGFloat
    var longitude: CGFloat
    
    init(mapItem: MKMapItem){
        self.title = mapItem.name ?? ""
        self.subtitle = mapItem.placemark.title ?? ""
        self.latitude = mapItem.placemark.coordinate.latitude
        self.longitude = mapItem.placemark.coordinate.longitude
    }
    
    
}
