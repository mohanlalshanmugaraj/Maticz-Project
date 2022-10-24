//
//  SwiftUIView.swift
//  MAP EXAMPLE
//
//  Created by Ajaaypranav R K on 22/10/22.
//

import SwiftUI
import CoreLocation

struct Home: View {
    @State var locationManger  = CLLocationManager()
    @StateObject var mapVM = MapViewModel()
    var body: some View {
        ZStack {
            MapView()
                .environmentObject(mapVM)
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search",text: $mapVM.searchTxt)
                    }.padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(20)
                    .padding()
                    
                    if mapVM.places.count != 0 && !mapVM.searchTxt.isEmpty {
                        ScrollView {
                            VStack {
                                ForEach(mapVM.places) { place in
                                    Text(place.place.name ?? "")
                                        .foregroundColor(.black)
                                        .frame(maxWidth:.infinity,alignment: .leading)
                                        .onTapGesture(perform: {
                                            mapVM.selectedPlace(place: place)
                                        })
                                    Divider()
                                }
                            }
                        }.background(.white)
                    }
                    
                }.padding()
                
                
                
                Spacer()
                VStack {
                    Button {
                        mapVM.focuseLocation()
                    }label: {
                        Image(systemName: "location.fill")
                            .font(.title2)
                            .padding(10)
                            .foregroundColor(.blue)
                            .background(.black)
                            .clipShape(Circle())
                        
                    }.frame(maxWidth:.infinity,alignment: .trailing)
                        .padding(.trailing)
                    
                    Button {
                        mapVM.updateMapType()
                    }label: {
                        Image(systemName: mapVM.mapType == .standard ? "network" : "map")
                            .font(.title2)
                            .padding(10)
                            .foregroundColor(.blue)
                            .background(.black)
                            .clipShape(Circle())
                        
                    }.frame(maxWidth:.infinity,alignment: .trailing)
                        .padding()
                }
                
            }
        }.onChange(of: mapVM.searchTxt, perform: onChangeSearchText)
        .onAppear(perform: mapVM.onAppear)
            .alert(isPresented: $mapVM.permissionDenied) {
                Alert(title: Text("Permission denied"), message: Text("Please Enable in App Settings"), dismissButton: .default(Text("Go to Settings"),action: {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }))
            }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


extension Home {
    
    func onChangeSearchText(newValue : String) {
        if newValue.isEmpty {
            mapVM.removeAllPlace()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            if newValue == mapVM.searchTxt {
                mapVM.searchQuery()
            }
        })
    }
    
    func onAppear() {
        locationManger.delegate = mapVM
        locationManger.requestWhenInUseAuthorization()
    }
}
