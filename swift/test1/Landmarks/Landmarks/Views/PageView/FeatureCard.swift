//
//  FeatureCard.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark


    var body: some View {
        ZStack() {
            landmark.featureImage?
                .resizable()
            Text("\(landmark.id)")
                .foregroundColor(.red)
        }
    }
}


#Preview {
    FeatureCard(landmark: ModelData.sharedInstance().features[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}

