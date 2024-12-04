//
//  LandmarkList.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI


struct LandmarkList: View {
    @State private var landmarkList: [Landmark] = landmarks
    @State private var showFavoritesOnly: Bool = false
    var filteredLandmarks: [Landmark] {
        landmarkList.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }

    var body: some View {

        VStack() {
            HStack {
                // del
                Button(action: {
                    print("del button clicked")
                    if landmarkList.count > 0 {
                        landmarkList.remove(at: 0)
                    }
                }, label: {
                    Text("del").foregroundColor(.red)
                }).background(Color.blue).frame(height: 160)//.id("idDelFirst")
                // filter
                Button(action: {
                    print("filter button clicked, showFavoritesOnly:")
                    showFavoritesOnly = !showFavoritesOnly
                }, label: {
                    Text("filter=\(showFavoritesOnly.description)")
                }).background(Color.orange).frame(height: 50).offset(x: 100)//.id("idFilterFavorite")
            }
            NavigationSplitView {
                List {
                    ForEach(filteredLandmarks, id: \.id) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            LandmarkRow(landmark: landmark)
                        }}
                }
                .navigationTitle("Landmarks")
            } detail: {
                Text("Select a Landmark")
            }
        }
    }
}


#Preview {
    LandmarkList()
}

