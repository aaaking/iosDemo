//
//  ContentView.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        VStack(alignment: .leading) {
            Text("Turtle Rock")
                .font(.title)
                .foregroundColor(Color.pink)
                .padding(6.0)
                .frame(width: nil, height: nil)
            HStack {
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
