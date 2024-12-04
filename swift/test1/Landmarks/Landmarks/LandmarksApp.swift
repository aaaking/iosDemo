//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(modelData)
        }
    }
}
