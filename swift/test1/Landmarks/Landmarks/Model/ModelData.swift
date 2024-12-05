//
//  ModelData.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/4.
//

import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }

    private init() {}

    // 2. 创建静态常量，作为类的唯一实例
    static let shared = ModelData()

    // 3. 提供访问该实例的方法
    static func sharedInstance() -> ModelData {
        return shared
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data;
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as main \(T.self):\(error)")
    }
}
