//
//  ContentView.swift
//  Maticz Project
//
//  Created by Ajaaypranav R K on 23/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var isActive:Bool = false
    var body: some View {
        VStack {
            if self.isActive {
                NavigationView {
                    LanchScreen()
                }
            } else {
                SplashScreen()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
