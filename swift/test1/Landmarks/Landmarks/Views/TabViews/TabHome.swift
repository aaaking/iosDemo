//
//  TabHome.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI

struct TabHome: View {
    @State private var modelData = ModelData()

    var body: some View {
        LandmarkList().environment(modelData)
    }
}

#Preview {
    TabHome()
}
