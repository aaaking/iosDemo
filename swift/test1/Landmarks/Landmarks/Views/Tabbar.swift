//
//  Tabbar.swift
//  Landmarks
//
//  Created by aaaking on 2024/12/5.
//

import SwiftUI

struct Tabbar: View {
    @State var currentSelected: Tab = .home
    @Namespace var animationNamespace
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tabItem in
                Button {
                    withAnimation(.spring(response: 0.3,dampingFraction: 0.7)) {
                        currentSelected = tabItem
                    }
                } label:{
                    VStack{
                        Image(systemName: tabItem.icon)
                            .font(.system(size: 24))
                            .frame(height: 30)
                        Text(tabItem.text)
                            .font(.body.bold())
                    }
                    .foregroundColor(currentSelected == tabItem ? .pink : .secondary)
                    .frame(maxWidth: .infinity)
                    // 新增背景过渡效果
                    .background(
                        ZStack{
                            if currentSelected == tabItem {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.pink.opacity(0.2))
                                    .matchedGeometryEffect(id: "background_rectangle", in: animationNamespace)
                            }
                        }
                    )
                }
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 4)
        .padding(.horizontal)
        .frame(maxHeight: .infinity,alignment: .bottom)
        // 如果你的tabbar需求是贴着底部的话，你可以加上 .ignoresSafeArea() 修饰符，作用是忽略iphone的安全区域。
    }
}

#Preview {
    Tabbar()
}
