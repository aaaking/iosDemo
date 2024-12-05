//
//  TabLocation.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI

struct TabCategory: View {
    @State private var modelData = ModelData.sharedInstance()

    var body: some View {
        NavigationSplitView {
            List {
                modelData.landmarks[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
            }
            .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    TabCategory()
}
