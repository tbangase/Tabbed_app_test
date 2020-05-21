//
//  ContentView.swift
//  Tabbed_app_test
//
//  Created by Toshiki Ichibangase on 2020/04/15.
//  Copyright © 2020 Toshiki Ichibangase. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @State private var colorScheme: ColorScheme = .dark
 
    var body: some View {
        TabView(selection: $selection){
            IndicatorView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Indicator")
                    }
                }
                .tag(0)
            LineChartView()
                .environment(\.colorScheme, colorScheme)
                .tabItem {
                    VStack {
                        Image(systemName: "square.stack.3d.down.right")
                        Text("Line Chart")
                    }
                }
                .tag(1)
            
            Text("Third View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "photo")
                            .scaledToFit()
                            .overlay(Color.primary)
                        Text("Third")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
