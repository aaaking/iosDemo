//
//  TabLocation.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI

struct TabCategory: View {
    @State private var modelData = ModelData.sharedInstance()
    @State private var showingProfile = false

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
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    TabCategory()
}
