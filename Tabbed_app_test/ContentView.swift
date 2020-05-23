//
//  ContentView.swift
//  Tabbed_app_test
//
//  Created by Toshiki Ichibangase on 2020/04/15.
//  Copyright © 2020 Toshiki Ichibangase. All rights reserved.
//

import SwiftUI

class CustomEnvironment : ObservableObject {
    @Published var colorScheme: ColorScheme = .dark
}



struct ContentView: View {
    @State private var selection = 0
    @State private var colorScheme: ColorScheme = .dark
    
    @ObservedObject var env = CustomEnvironment()
    @ObservedObject var user = UserInformation()
    
    var body: some View {
        CustomTabView(env: env, user: user).environment(\.colorScheme, env.colorScheme)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(env:  CustomEnvironment()).environment(\.colorScheme, .dark)
    }
}
