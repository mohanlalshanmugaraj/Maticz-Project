//
//  MapViewModel.swift
//  Maticz Project
//
//  Created by Ajaaypranav R K on 24/10/22.
//

import Foundation
import MapKit
import CoreLocation

class MapViewModel : NSObject, ObservableObject,CLLocationManagerDelegate {
    @Published var mapView = MKMapView()
    @Published var region : MKCoordinateRegion!
    
    @Published var locationManger  = CLLocationManager()
    
    @Published var permissionDenied : Bool = false
    
    @Published var mapType : MKMapType = .standard
    
    @Published var searchTxt : String = ""
    
    @Published var places : [Place] = []
    
    @Published var destination : [String] = []
    
   func onAppear() {
     //  mapView.delegate = self
       locationManger.delegate = self
       locationManger.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .denied :
            permissionDenied.toggle()
        case .notDetermined :
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse :
           // manager.delegate = self
            manager.requestLocation()
        default : ()
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFinishDeferredUpdatesWithError error: Error?) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Swift.Error) {
        
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        
        
        self.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000,longitudinalMeters: 10000)
        
        self.mapView.setRegion(region, animated: true)
        
        self.mapView.setVisibleMapRect(self.mapView.visibleMapRect, animated: true)
    }
    
    
    func updateMapType() {
        if mapType == .standard {
            mapType = .hybrid
            mapView.mapType = .hybrid
        }else {
            mapView.mapType = .standard
            mapType = .standard
        }
    }
    
    func focuseLocation() {
        guard let _ = region else {return}
        
        mapView.setRegion(region, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
    }
    
    func searchQuery() {
     //   places.removeAll()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchTxt
        
        MKLocalSearch(request: request).start { response, _ in
            guard let res = response else {return}
            
            self.places.append(contentsOf: res.mapItems.compactMap({ (items) -> Place? in
                return Place(place: items.placemark)
            }))
            
            
        }
    }
    
    
    func selectedPlace(place: Place) {
        searchTxt = ""
        guard let coordinate = place.place.location?.coordinate else {
            return
        }
        
        
        
        let pointAnimation = MKPointAnnotation()
        pointAnimation.coordinate = coordinate
        pointAnimation.title = place.place.name ?? ""
       // mapView.removeAnnotation(mapView.annotations)
        
     //   mapView.addAnnotation([place.place,place.place])
        
        mapView.addAnnotation(pointAnimation)
        
        let corrdinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(corrdinateRegion, animated: true)
        mapView.setVisibleMapRect(mapView.visibleMapRect, animated: true)
        
        dictination(place: place)
        
    }
    
    
    func removeAllPlace() {
        places.removeAll()
    }
    
    func dictination(place: Place) {
        if let coordination1 =  place.place.location?.coordinate {
            guard let coordination2 = locationManger.location?.coordinate else {return}
            let p1 = MKPlacemark(coordinate: coordination1)
            let p2 = MKPlacemark(coordinate: coordination2)
            
            let result = MKDirections.Request()
            result.source = MKMapItem(placemark: p1)
            result.destination = MKMapItem(placemark: p2)
            result.transportType = .automobile
            
            let destination = MKDirections(request: result)
            destination.calculate { response, error in
                guard let rote = response?.routes.first else {return}
                self.mapView.addAnnotations([p1,p2])
                self.mapView.addOverlay(rote.polyline)
                self.mapView.setVisibleMapRect(rote.polyline.boundingMapRect,edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20) , animated: true)
                
                self.destination = rote.steps.map{ $0.instructions }.filter{ !$0.isEmpty}
                 
            }
        }
       
        
    }
    
    
}

