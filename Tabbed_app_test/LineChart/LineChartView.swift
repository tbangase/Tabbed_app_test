//
//  LineChartView.swift
//  Tabbed_app_test
//
//  Created by Toshiki Ichibangase on 2020/05/21.
//  Copyright © 2020 Toshiki Ichibangase. All rights reserved.
//

import SwiftUI

struct LineChartView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let sampleData = [[0.0,0.0], [1.0, 2.0], [2.0, 3.0], [3.0, -1.0],[4.0, 6.0]]
    let sampleData2 = [[0.0,0.0], [1.0, -2.0], [2.0, 4.0], [4.0, 1.0]]
    let offset: CGFloat = 20
    let cardHeight: CGFloat = 200
    var body: some View {
        GeometryReader { geo in
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: geo.size.width/2 - self.offset*2,
                               height: self.cardHeight)
                        .foregroundColor(self.colorScheme == .dark ? .black : .white)
                        .padding(self.offset)
                        .shadow(color: self.colorScheme == .dark ? Color.red : Color.gray, radius: 10)
                    
                    VStack {
                        HStack {
                            Text("Heart Rate")
                                .font(.title)
                            Spacer()
                        }.padding(.leading)
                        Spacer()
                    }.frame(width: geo.size.width/2 - self.offset*2,
                            height: self.cardHeight - 30)
                    
                    LineView(dataSet: self.sampleData)
                        .frame(width: geo.size.width/2 - self.offset*2,
                               height: self.cardHeight - 70)
                        .offset(x: 0, y: 20)
                }.offset(x:self.offset/4, y:0)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: geo.size.width/2 - self.offset*2,
                               height: self.cardHeight)
                        .foregroundColor(self.colorScheme == .dark ? .black : .white)
                        .padding(self.offset)
                        .shadow(color: self.colorScheme == .dark ? Color.red : Color.gray, radius: 10)
                    //.shadow(radius: 10)
                    
                    VStack {
                        HStack {
                            Text("Calorie")
                                .font(.title)
                            Spacer()
                        }.padding(.leading)
                        Spacer()
                    }.frame(width: geo.size.width/2 - self.offset*2,
                            height: self.cardHeight - 30)
                    
                    LineView(dataSet: self.sampleData2)
                        .frame(width: geo.size.width/2 - self.offset*2,
                               height: self.cardHeight - 70)
                        .offset(x: 0, y: 20)
                }.offset(x:-self.offset/4, y:0)
            }
        }
        .background(colorScheme == .dark ? Color.black : Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        LineChartView()
            .environment(\.colorScheme, .dark)
    }
}
