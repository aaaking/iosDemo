//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI

struct LandmarkRow: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    init(landmark: Landmark) {
        self.landmark = landmark
    }

    var body: some View {
        @Bindable var modelData = modelData
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text("\(landmark.id)-\(landmark.name)")
            Spacer()
            if $modelData.landmarks[landmarkIndex].isFavorite.wrappedValue {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        
    }
}

#Preview("Salmon") {
    let modelData = ModelData.sharedInstance()
    let landmarks = modelData.landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0]).environment(modelData)
        LandmarkRow(landmark: landmarks[1]).environment(modelData)
        LandmarkRow(landmark: landmarks[2]).environment(modelData)
        LandmarkRow(landmark: landmarks[3]).environment(modelData)
        LandmarkRow(landmark: landmarks[4]).environment(modelData)
        LandmarkRow(landmark: landmarks[5]).environment(modelData)
        LandmarkRow(landmark: landmarks[6]).environment(modelData)
    }
}

