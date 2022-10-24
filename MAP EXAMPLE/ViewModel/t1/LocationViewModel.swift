//
//  LocationViewModel.swift
//  MAP EXAMPLE
//
//  Created by Ajaaypranav R K on 22/10/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel : ObservableObject  {
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    @Published var locations : [Location] = []
    @Published var location : Location {
        didSet {
            updateMapRegion(location: location)
        }
    }
    @Published var showListLocation : Bool = false
    @Published var mapRegion : MKCoordinateRegion = MKCoordinateRegion()
    
    init() {
        locations = LocationsDataService.locations
        location = LocationsDataService.locations.first!
        self.updateMapRegion(location: location)
    }
    
    private func updateMapRegion(location : Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut) {
            showListLocation.toggle()
        }
    }
    
    func showNextLocation(location : Location) {
        withAnimation(.easeInOut) {
            self.location = location
            self.showListLocation = false
        }
    }
}
