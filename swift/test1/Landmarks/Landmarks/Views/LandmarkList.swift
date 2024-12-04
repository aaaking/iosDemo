//
//  LandmarkList.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI


struct LandmarkList: View {
    @Environment(ModelData.self) var modelData2
    @State var modelData = ModelData()
    @State private var landmarkList: [Landmark] = []
    @State private var showFavoritesOnly: Bool = false
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    init() {
        _landmarkList = State(initialValue: modelData.landmarks)
        //        filteredLandmarks = {
        //            landmarkList.filter { landmark in
        //                (!showFavoritesOnly || landmark.isFavorite)
        //            }
        //        }()
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                // del
                Button(action: {
                    if landmarkList.count > 0 {
                        landmarkList.remove(at: 0)
                    }
                    print("del button clicked origin size=\(modelData.landmarks.count)")
                }, label: {
                    Text("del").foregroundColor(.black)
                }).tag("featf").background(Color.blue)//.foregroundColor(.pink)//.id("idDelFirst")
                // filter
                Button(action: {
                    print("filter button clicked, showFavoritesOnly:")
                    showFavoritesOnly = !showFavoritesOnly
                }, label: {
                    Text("filter=\(showFavoritesOnly.description)")
                }).tag("243qrfe").background(Color.orange)//.id("idFilterFavorite")
                ForEach(filteredLandmarks, id: \.id) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark).environment(modelData)
                    } label: {
                        LandmarkRow(landmark: landmark).environment(modelData)
                    }}
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    LandmarkList().environment(ModelData())
}

