//
//  TabCollect.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI

struct TabHike: View {
    @State private var modelData = ModelData.sharedInstance()

    var body: some View {
        PageView(pages: ModelData.sharedInstance().features.map { FeatureCard(landmark: $0) })
    }
}

#Preview {
    TabHike()
}
