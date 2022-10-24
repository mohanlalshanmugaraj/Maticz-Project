//
//  VerifyOTP.swift
//  Maticz Project
//
//  Created by Ajaaypranav R K on 24/10/22.
//

import SwiftUI

struct VerifyOTP: View {
    @Environment(\.presentationMode) var mode
    @State var mobileNumber : String = ""
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.backward")
                    .padding()
                    .onTapGesture(perform: {
                        mode.wrappedValue.dismiss()
                    })
                Text("TAXI")
                    .font(.headline)
                    .fontWeight(.black)
                    .frame(maxWidth:.infinity,alignment:.center)
                    .padding()
                    .padding(.trailing,30)
                
            }.frame(maxWidth:.infinity,alignment: .leading)
                .background(.yellow)
            
            VStack (alignment:.leading){
                Image(systemName: "archivebox.circle.fill")
                    .resizable()
                    .frame(width:65,height: 65)
                    .foregroundColor(.yellow)
                    .padding([.top,.trailing])
                
                
                Text("Enter your 4 Digit")
                    .font(.title3)
                    .padding(5)
                
                Text("Verification Code")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.yellow)
                    .padding(5)
                
                Text("OTP")
                    .font(.title3)
                    .padding(5)
                
                VStack {
                    HStack {
                        TextField("OTP",text: $mobileNumber)
                            .padding()
//                        Spacer()
//                        Image(systemName: "person.fill")
//                            .padding()
//                            .foregroundColor(.yellow)
                        
                    }
                    Divider()
                        .foregroundColor(.black)
                        .padding(.trailing)
                    
                    
                }
                
                NavigationLink {
                    HomeMapView()
                }label: {
                    Text("Next")
                        .foregroundColor(.yellow)
                        .padding(8)
                        .cornerRadius(10)
                        .clipShape(Circle())
                        .padding([.leading,.trailing])
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.yellow)
                        )
                }
                .frame(maxWidth:.infinity,alignment: .trailing)
                .padding()
                
            }.frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading)
            
            Spacer()
            
        }
        .navigationBarHidden(true)
        
        
    }
}

struct VerifyOTP_Previews: PreviewProvider {
    static var previews: some View {
        VerifyOTP()
    }
}
