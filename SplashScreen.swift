//
//  SplashScreen.swift
//  main
//
//  Created by Thekra on 24/08/1444 AH.
//

import SwiftUI


struct SplashScreen: View {
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.3
    
    var body: some View {
        if isActive {
            TabVieww()
        } else {
            VStack {
                VStack {
                    Image("alif")
                                    }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        self.size = 0.9
                        self.opacity = 3.00
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
                
            }

        }
    }
}


struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
