//
//  Tab.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import Foundation
enum Tab: CaseIterable {
    case home
    case location
    case collect
    case mine
    
    var text:String{
        switch self{
        case .home:
            return "首页"
        case .location:
            return "Category"
        case .collect:
            return "Pager"
        case .mine:
            return "我的"
        }
    }
    
    var icon:String{
        switch self{
        case .home:
            return "book"
        case .location:
            return "location"
        case .collect:
            return "heart"
        case .mine:
            return "person"
        }
    }
}
