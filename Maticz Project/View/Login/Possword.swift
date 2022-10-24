//
//  Possword.swift
//  Maticz Project
//
//  Created by Ajaaypranav R K on 23/10/22.
//

import SwiftUI

struct Possword: View {
    @Environment(\.presentationMode) var mode
    @State var password : String = ""
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
                
                Group {
                Image(systemName: "archivebox.circle.fill")
                    .resizable()
                    .frame(width:65,height: 65)
                    .foregroundColor(.yellow)
                    .padding([.top,.trailing])
                
                
                Text("Proceed with your")
                    .font(.title3)
                    .padding(5)
                
                Text("Fingure or password")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.yellow)
                    .padding(5)
                
                Image("fingerprint")
                    .resizable()
                    .frame(width:65,height: 65)
                    .foregroundColor(.yellow)
                    .padding([.top,.trailing])
                    
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Divider()
                    }
                    Text("OR")
                        .font(.system(size: 12))
                    VStack {
                        Divider()
                    }
                }
            
                Spacer()
                
                Text("Password")
                    .font(.title3)
                    .padding(5)
                
                VStack {
                    HStack {
                        TextField("*******",text: $password)
                            .padding()
                        Spacer()
                        Image(systemName: "eye.slash.fill")
                            .padding()
                            .foregroundColor(.black)
                        
                    }
                    Divider()
                        .foregroundColor(.black)
                        .padding(.trailing)
                    
                    
                }
                
                NavigationLink {
                    MobileView()
                }label: {
                    Text("Save")
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
                
                Spacer()
                
            }.frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading)
            
            Spacer()
            
        }
        .navigationBarHidden(true)
    }
}

struct Possword_Previews: PreviewProvider {
    static var previews: some View {
        Possword()
    }
}
