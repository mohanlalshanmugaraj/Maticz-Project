//
//  LocationListView.swift
//  MAP EXAMPLE
//
//  Created by Ajaaypranav R K on 22/10/22.
//

import SwiftUI

struct LocationListView: View {
    @EnvironmentObject  var vm : LocationViewModel
    var body: some View {
        List {
            ForEach(vm.locations,id: \.id) { location in
                Button {
                    vm.showNextLocation(location: location)
                }label: {
                    locationListRow(location: location)
                }.padding(.vertical, 4)
                    .listRowBackground(Color.clear)
                
                
            }.listStyle(PlainListStyle())
        }
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationViewModel())
    }
}


extension LocationListView {
    
    private func locationListRow(location:Location) -> some View {
        HStack {
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack (alignment:.leading){
                Text(location.name)
                    .font(.headline)
                    .foregroundColor(.black)
                Text(location.cityName)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
    
    
   
    
    
}
