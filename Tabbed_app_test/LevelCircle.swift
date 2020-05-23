//
//  LevelCircle.swift
//  Tabbed_app_test
//
//  Created by Toshiki Ichibangase on 2020/05/23.
//  Copyright © 2020 Toshiki Ichibangase. All rights reserved.
//

import SwiftUI

struct LevelCircle: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isShowCircle: CGFloat = 0
   
    @Binding var experience: Double
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack {
                    Circle()
                        .trim(from: 0, to: CGFloat(self.experience) * self.isShowCircle)
                        .stroke(Color.blue, lineWidth: 3)
                        .rotationEffect(Angle(degrees: -90))
                        .frame(width: 150, height: 150)
                        .onAppear(perform: {
                            self.isShowCircle = 0
                            withAnimation(.easeInOut(duration: 2)) {
                                self.isShowCircle = 1
                            }
                    })
                    
                    Text("LV. 31")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                        
                        
                }
                
                Button(action: {
                    self.isShowCircle = 0
                    withAnimation(.easeInOut(duration: 2)) {
                        self.isShowCircle = 1
                    }
                }) {
                    Text("Play circle")
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .background(self.colorScheme == .dark ? Color.black : Color.white)
        }
    }
}

struct LevelCircle_Previews: PreviewProvider {
    static var previews: some View {
        LevelCircle(experience: .constant(0.7)).environment(\.colorScheme, .dark)
    }
}
