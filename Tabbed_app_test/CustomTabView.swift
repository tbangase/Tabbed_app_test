//
//  CustomTabView.swift
//  Tabbed_app_test
//
//  Created by Toshiki Ichibangase on 2020/05/22.
//  Copyright © 2020 Toshiki Ichibangase. All rights reserved.
//

import SwiftUI

struct CustomTabView: View {
    @State private var selection = 0
    //@State private var colorScheme: ColorScheme = .dark
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var env: CustomEnvironment
    @ObservedObject var user: UserInformation
    
    var body: some View {
        GeometryReader { geo in
            TabView(selection: self.$selection){
                IndicatorView()
                    .tabItem {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Indicator")
                        }
                    }
                    .tag(0)
                VStack{
                    LineCardView()
                        .environment(\.colorScheme, self.env.colorScheme)
                    
                    Button(action: {
                        if self.colorScheme == .dark {
                            withAnimation {
                                self.env.colorScheme = .light
                            }
                        } else {
                            withAnimation {
                                self.env.colorScheme = .dark
                            }
                        }
                    }) {
                        Text("Dark mode On/Off")
                            .frame(width: geo.size.width, height: 50)
                            //.background(self.colorScheme == .dark ? Color.black : Color.white)
                    }
                }.background(self.colorScheme == .dark ? Color.black : Color.white)
                    .tabItem {
                        VStack {
                            Image(systemName: "square.stack.3d.down.right")
                            Text("Line Chart")
                        }
                    }
                    .tag(1)
                
                LevelCircle(experience: .constant(0.7))
                    .environment(\.colorScheme, self.env.colorScheme)
                    .tabItem {
                        VStack {
                            Image(systemName: "photo")
                                .scaledToFit()
                                .overlay(Color.primary)
                            Text("Level Circle")
                        }
                    }
                    .tag(2)
            }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    @ObservedObject var env = CustomEnvironment()
    static var previews: some View {
        CustomTabView(env: CustomEnvironment(), user: UserInformation()).environment(\.colorScheme, .dark)
    }
}
