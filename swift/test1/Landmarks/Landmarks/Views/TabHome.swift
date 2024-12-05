//
//  TabHome.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI

struct TabHome: View {
    var body: some View {
        LandmarkList().environment(ModelData())
    }
}

#Preview {
    TabHome()
}
