//
//  ContentView.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, swift!").font(.title).foregroundColor(Color.pink).padding(6.0).frame(width: nil, height: nil)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
