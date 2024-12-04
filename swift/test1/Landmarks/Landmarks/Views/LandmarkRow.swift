//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text("\(landmark.id)-\(landmark.name)")
            Spacer()
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        
    }
}

#Preview("Salmon") {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
        LandmarkRow(landmark: landmarks[2])
        LandmarkRow(landmark: landmarks[3])
        LandmarkRow(landmark: landmarks[4])
        LandmarkRow(landmark: landmarks[5])
        LandmarkRow(landmark: landmarks[6])
    }
}

