//
//  LandmarkList.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI


struct LandmarkList: View {
    @State var landmarkList: [Landmark] = landmarks

    var body: some View {
        Button(action: {
            if landmarkList.count > 0 {
                landmarkList.remove(at: 0)
            }
        }, label: {
            Text("del")
        })
        NavigationSplitView {
            List(landmarkList, id: \.id) {landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }.navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    LandmarkList()
}

