//
//  Splash.swift
//  BreadfastMobile Task IOS
//
//  Created by mohamed albohy on 09/04/2023.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if isActive {
                    Image(Assets.splashImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.7,
                               height: geometry.size.width * 0.7)
                } else {
                    PostsViewCoordinator().build()
                }
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = false
                }
            }
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
