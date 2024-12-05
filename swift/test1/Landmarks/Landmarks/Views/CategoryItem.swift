//
//  CategoryItem.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI


struct CategoryItem: View {
    var landmark: Landmark


    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text("\(landmark.id)-\(landmark.name)")
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}


#Preview {
    CategoryItem(landmark: ModelData.sharedInstance().landmarks[0])
}
