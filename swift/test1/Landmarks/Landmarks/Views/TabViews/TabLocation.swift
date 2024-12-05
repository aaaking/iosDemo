//
//  TabLocation.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI

struct TabLocation: View {
    var body: some View {
        NavigationSplitView {
            Text("Hello, World!")
                .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    TabLocation()
}
