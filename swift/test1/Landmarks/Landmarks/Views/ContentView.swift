//
//  ContentView.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI

struct ContentView: View {
    let mTabbarHeight: CGFloat = 50
    @State private var currentSelected:Tab = .home

    var body: some View {
        GeometryReader { geometry in
            VStack {
                switch currentSelected {
                case .home:
                    TabHome().frame(height: geometry.size.height - mTabbarHeight)
                case .location:
                    TabCategory().frame(height: geometry.size.height - mTabbarHeight)
                case .collect:
                    TabHike().frame(height: geometry.size.height - mTabbarHeight)
                case .mine:
                    TabMine().frame(height: geometry.size.height - mTabbarHeight)
                }
                
                Tabbar(currentSelected:$currentSelected).frame(height: mTabbarHeight)
            }
        }
    }
}

#Preview {
    ContentView()
}
