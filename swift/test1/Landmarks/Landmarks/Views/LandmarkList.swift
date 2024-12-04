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
                    Text("del").foregroundColor(.black).frame(height: 50)
                }).frame(height: 60).background(Color.blue)//.foregroundColor(.pink)//.id("idDelFirst")
                Spacer()
                // filter
                Button(action: {
                    print("filter button clicked, showFavoritesOnly:")
                    showFavoritesOnly = !showFavoritesOnly
                }, label: {
                    Text("filter=\(showFavoritesOnly.description)")
                }).frame(height: 50).background(Color.orange)//.id("idFilterFavorite")
            }
            Spacer()
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

