//
//  LocationsView.swift
//  MAP EXAMPLE
//
//  Created by Ajaaypranav R K on 22/10/22.
//

import SwiftUI
import MapKit
struct LocationsView: View {
    @StateObject var locationVM = LocationViewModel()
    var body: some View {
        ZStack {
            Map(coordinateRegion: $locationVM.mapRegion)
                .ignoresSafeArea()
            
            VStack (spacing: 0){
                header
                    .padding()
                Spacer()
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}

extension LocationsView {
    private var header : some View {
        VStack {
            Button(action: locationVM.toggleLocationList, label: {
                Text("\(locationVM.location.name), \(locationVM.location.cityName)")
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth:.infinity)
                    .animation(.none,value: locationVM.location)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: locationVM.showListLocation ? 180 : 0))
                    }
            })
           
            
            if locationVM.showListLocation {
                LocationListView().environmentObject(locationVM)
            }
           
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
}
