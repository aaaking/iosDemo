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
        VStack() {
//            HStack {
//                Divider().frame(height: 10)
//                // del
//                Button(action: {
//                    print("del button clicked")
//                    if landmarkList.count > 0 {
//                        landmarkList.remove(at: 0)
//                        print("origin size=\(modelData.landmarks.count)")
//                    }
//                }, label: {
//                    Text("del").frame(height: 50).foregroundColor(.black)
//                }).frame(height: 60).background(Color.blue)//.foregroundColor(.pink)//.id("idDelFirst")
//                Divider().frame(height: 10)
//                // filter
//                Button(action: {
//                    print("filter button clicked, showFavoritesOnly:")
//                    showFavoritesOnly = !showFavoritesOnly
//                }, label: {
//                    Text("filter=\(showFavoritesOnly.description)")
//                }).frame(height: 50).background(Color.orange)//.id("idFilterFavorite")
//            }
//            Spacer()
            NavigationSplitView {
                List {
                    Toggle(isOn: $showFavoritesOnly) {
                        Text("Favorites only")
                    }
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
}


#Preview {
    LandmarkList().environment(ModelData())
}

