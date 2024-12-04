//
//  LandmarkList.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI


struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {
            List(landmarks, id: \.id) {landmark in
                NavigationLink {
                    LandmarkDetail()
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }.navigationTitle("Select a landmark")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    LandmarkList()
}

