//
//  IndicatorView.swift
//  Tabbed_app_test
//
//  Created by Toshiki Ichibangase on 2020/04/30.
//  Copyright © 2020 Toshiki Ichibangase. All rights reserved.
//

import SwiftUI

struct IndicatorView: View {
    @State var isAnimation = false
    @State var rotationDegree = 0.0
    
    @State var animationDegree = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0.4, to: 1.0)
                    .stroke(AngularGradient(gradient: Gradient(colors: [.white, .green]), center: .center), style: StrokeStyle(lineWidth: 10,
                                    lineCap: .round,
                                    dash: [0.1, 15],
                                    dashPhase: 0))
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .rotationEffect(Angle(degrees: animationDegree))
                    //.rotationEffect(Angle(degrees: isAnimation ? rotate(degrees: 360) : 0))
                    .onAppear() {
                        withAnimation(
                        Animation
                            .linear(duration: 1)
                            .repeatForever(autoreverses: false)) {
                                //self.isAnimation.toggle()
                                self.animationDegree += 360
                        }
                }
            }
        }
    }
    
    func rotate(degrees: Double) -> Double {
        rotationDegree += degrees
        return rotationDegree + degrees
    }
}

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView()
    }
}
