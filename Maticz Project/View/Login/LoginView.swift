//
//  LoginView.swift
//  Maticz Project
//
//  Created by Ajaaypranav R K on 23/10/22.
//

import SwiftUI


struct LoginView: View {
    @Environment(\.presentationMode) var mode
    @State var userName : String = ""
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
                
                
                Text("Proceed with your")
                    .font(.title3)
                    .padding(5)
                
                Text("Login")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.yellow)
                    .padding(5)
                
                Text("User Name")
                    .font(.title3)
                    .padding(5)
                
                VStack {
                    HStack {
                        TextField("User Name",text: $userName)
                            .padding()
                        Spacer()
                        Image(systemName: "person.fill")
                            .padding()
                            .foregroundColor(.yellow)
                        
                    }
                    Divider()
                        .foregroundColor(.black)
                        .padding(.trailing)
                    
                    
                }
                
                NavigationLink {
                    Possword()
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
                
                
                Spacer()
                
                HStack {
                    VStack {
                        Divider()
                    }
                    Text("OR CONNECT WITH")
                        .font(.system(size: 12))
                    VStack {
                        Divider()
                    }
                }
            
                
                
                
                HStack {
                    HStack{
                        Image("Facebook_Logo")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .leading)
                        Text("FaceBook")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .fontWeight(.heavy)
                    }
                    .padding()
                    .frame(width:150)
                    .background(.blue)
                    .cornerRadius(20)
                    
                    Spacer()
                    
                    HStack{
                        Image("google")
                            .resizable()
                            .frame(width: 24, height: 24, alignment: .leading)
                        Text("google")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .fontWeight(.heavy)
                    }
                    
                    .padding()
                    .frame(width:150)
                    .background(.red)
                    .cornerRadius(20)
                   
                }
                .padding()
               
                
                Spacer()
                
                
                
                
            }.frame(maxWidth:.infinity,alignment: .leading)
                .padding(.leading)
            
            Spacer()
            
            
        }.navigationBarHidden(true)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


