//
//  ContentViewModel.swift
//  MapKitExample
//
//  Created by Ahmet Buğra Özcan on 18.11.2022.
//

import Foundation
import MapKit
import Combine

final class ContentViewModel: ObservableObject{
    private var cancellable: AnyCancellable?
    
    @Published var cityText = ""
    
    @Published var poiText = ""
    
    @Published var viewData = [LocalSearchViewData]()
    var service: LocalSearchService
    
    init(){
        // New york
        let center = CLLocationCoordinate2D(latitude: 40.730610, longitude: -73.935242)
        service = LocalSearchService(in: center)
        
        cancellable = service.localSearchPublisher.sink{ mapItems in
            self.viewData = mapItems.map({LocalSearchViewData(mapItem: $0)})
        }
    }
    
     func searchForCity(){
 
         service.searchCities(searchText: self.cityText)
    }
                             
     func searchForPOI(){
         
         service.searchPointOfInterests(searchText: self.poiText)
    }
    
    func clearCityText(){
        self.cityText = ""
    }
    
    func clearPOIText(){
        self.poiText = ""
    }
}
