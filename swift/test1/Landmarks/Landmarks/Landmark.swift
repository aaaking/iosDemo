//
//  Landmark.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import Foundation
struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
}
