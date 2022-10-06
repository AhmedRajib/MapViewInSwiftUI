//
//  LocationsViewModel.swift
//  SwiftUIMap
//
//  Created by Ahmed Rajib on 3/10/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject {
    
    @Published var locations: [Location]
    
     // MARK: - current Location on map
    @Published var mapLocation: Location {
        didSet {
            updateRegion(location: mapLocation)
        }
    }
    
     // MARK: - Current Region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
     // MARK: - show locations
    @Published var showLocationsList: Bool = false
    
    // MARK: -
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateRegion(location: locations.first!)
    }
    
    private func updateRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan)
        }
    }
    
    func taggoleLocationList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        
        
        // get Current Index
        
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else {
            print("Cound not find current index in locations array! SHould never happen.")
            return
        }
        
        // check if the current index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // next index is not valid
            // Restart from 0
            
            guard let firstLocatoin = locations.first else  { return }
            showNextLocation(location: firstLocatoin)
            return
        }
        // next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
