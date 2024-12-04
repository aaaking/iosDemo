//
//  LandmarkList.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI


struct LandmarkList: View {
    var body: some View {
        List(landmarks, id: \.id) {landmark in
            LandmarkRow(landmark: landmark)
        }
    }
}


#Preview {
    LandmarkList()
}

