//
//  TabCollect.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI

struct TabCollect: View {
    @State private var modelData = ModelData.sharedInstance()

    var body: some View {
        Group {
//            ForEach(modelData.hikes, id: \.id) {hike in
//                HikeView(hike: hike)
//            }
            HikeView(hike: modelData.hikes[0])
//            HikeView(hike: modelData.hikes[1])
//            HikeView(hike: modelData.hikes[2])
//            HikeView(hike: modelData.hikes[3])
//            for (index, hike) in modelData.hikes.enumerated() {
//                HikeView(hike: hike)
//            }
        }
    }
}

#Preview {
    TabCollect()
}
