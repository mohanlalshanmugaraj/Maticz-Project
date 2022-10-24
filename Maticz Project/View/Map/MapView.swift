//
//  MapView.swift
//  Maticz Project
//
//  Created by Ajaaypranav R K on 24/10/22.
//

import Foundation
import MapKit
import SwiftUI

struct MapView : UIViewRepresentable {
    @EnvironmentObject var mapVM : MapViewModel
    
    typealias UIViewType = MKMapView
    
    func makeCoordinator() -> Cordinator {
        return Cordinator()
    }
    
    
    
    func makeUIView(context: Context) -> MKMapView {
        let view = mapVM.mapView
       
        view.delegate = context.coordinator
        
        view.showsUserLocation = true
     //   view.delegate = context.
       // view.delegate = context.coordi
        return view

    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class Cordinator : NSObject,MKMapViewDelegate {
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if annotation.isKind(of: MKUserLocation.self){
                return nil
            }else {
                let pointAnnotaion = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "PIN_VIEW")
                pointAnnotaion.tintColor = .red
                pointAnnotaion.animatesDrop = true
                pointAnnotaion.canShowCallout = true
                return pointAnnotaion
            }
        }
    }
}




