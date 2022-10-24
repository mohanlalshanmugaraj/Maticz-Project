//
//  SplashScreen.swift
//  Maticz Project
//
//  Created by Ajaaypranav R K on 23/10/22.
//

import SwiftUI

struct SplashScreen: View {
    @Environment(\.presentationMode) var mode
    var body: some View {
        VStack {
            Image(systemName: "archivebox.circle.fill")
                .resizable()
                .frame(width:150,height: 150)
                .foregroundColor(.yellow)
                .padding([.top,.trailing])
            
            Text("WHEELS")
                .font(.title)
                .fontWeight(.heavy)
                .padding(5)
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
