//
//  CircleImage.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        //        Image(systemName: "globe")
        //            .imageScale(.large)
        //            .foregroundStyle(.tint)
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("green-1"))
}
