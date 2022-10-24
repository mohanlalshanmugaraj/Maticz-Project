//
//  HomeMapView.swift
//  Maticz Project
//
//  Created by Ajaaypranav R K on 24/10/22.
//

import SwiftUI
import CoreLocation

struct HomeMapView: View {
    
    @State var startingOffsetY : CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY : CGFloat = 0
    @State var endingOffsetY : CGFloat = 0
    
    
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
                            .foregroundColor(.white)
                            .background(.yellow)
                            .clipShape(Circle())
                        
                    }.frame(maxWidth:.infinity,alignment: .trailing)
                        .padding(.trailing)
                    
                    Button {
                        mapVM.updateMapType()
                    }label: {
                        Image(systemName: mapVM.mapType == .standard ? "network" : "map")
                            .font(.title2)
                            .padding(10)
                            .foregroundColor(.white)
                            .background(.yellow)
                            .clipShape(Circle())
                        
                    }.frame(maxWidth:.infinity,alignment: .trailing)
                        .padding()
                        .padding(.bottom,70)
                }
                
            }
            
            SubView()
                .offset(y: startingOffsetY)
                .offset(y:currentDragOffsetY)
                .offset(y : endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                currentDragOffsetY = value.translation.height
                            }
                        }.onEnded{ value  in
                            withAnimation(.spring()) {
                                if currentDragOffsetY < -150 {
                                    endingOffsetY = -startingOffsetY
                                }else if endingOffsetY != 0 && currentDragOffsetY > 150 {
                                    endingOffsetY = 0
                                }
                                currentDragOffsetY = 0
                                
                            }
                          
                        }
                )
            
            
        }.onChange(of: mapVM.searchTxt, perform: onChangeSearchText)
            .onAppear(perform: mapVM.onAppear)
            .alert(isPresented: $mapVM.permissionDenied) {
                Alert(title: Text("Permission denied"), message: Text("Please Enable in App Settings"), dismissButton: .default(Text("Go to Settings"),action: {
                    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                }))
                
                
    
            }.navigationBarHidden(true)
    }
}

struct HomeMapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMapView()
    }
}


extension HomeMapView {
    
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


struct SubView: View {
    var body: some View {
        VStack (spacing : 20){
            Image(systemName: "chevron.up")
               
            Text("Order")
                .font(.headline)
                 .fontWeight(.semibold)
            
            List {
                HStack {
                    Image(systemName: "archivebox.circle.fill")
                        .resizable()
                        .frame(width:65,height: 65)
                        .foregroundColor(.yellow)
                        .padding([.top,.trailing])
                    Text("Standard")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text("7MIN")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("250$")
                }
                
                HStack {
                    Image(systemName: "archivebox.circle.fill")
                        .resizable()
                        .frame(width:65,height: 65)
                        .foregroundColor(.yellow)
                        .padding([.top,.trailing])
                    Text("SHEATED")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    Text("7MIN")
                        .font(.footnote)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    Text("250$")
                }
            }
            
            
            
            Spacer()
        }.padding()
        .frame(maxWidth:.infinity)
        .background(.white)
        .cornerRadius(30)
    }
}
