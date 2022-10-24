//
//  LanchScreen.swift
//  Maticz Project
//
//  Created by Ajaaypranav R K on 23/10/22.
//

import SwiftUI

struct LanchScreen: View {
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "arrow.backward")
                    .padding()
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
                    .foregroundColor(.yellow)
                    .frame(width:150,height: 150)
                    .padding()
                    .frame(maxWidth:.infinity,alignment: .center)
                
               Text("EASY TO RIDE")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .padding()
                    .frame(maxWidth:.infinity,alignment: .center)
                
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo viverra maecenas accumsan lacus vel facilisis. Lorem ipsum dolor sit amet, consectetur adipiscing elit,")
                    .padding()
                    .font(.footnote)
                    .foregroundColor(.gray)
                
                
                NavigationLink {
                    LoginView()
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
                .frame(maxWidth:.infinity,alignment: .center)
                .padding()
            }
            .frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading)
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct LanchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LanchScreen()
    }
}
