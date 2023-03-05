//
//  Modifiers.swift
//  shenzhou
//
//  Created by 张伟 on 2023/3/5.
//

import SwiftUI
//SWIFTUI 自定义修饰符相当于UIKit 拓展View
//修饰符的好处就是可以增加属性（如var xx）但是拓展Extension只能拓展方法
struct BoldTitleWithPadding: ViewModifier {
    let edges:Edge.Set
    func body(content: Content) -> some View {
        content
            .font(.title.bold())
            .padding(edges,5)
    }
}

extension View {
    func boldTitleWithPadding(_ edges: Edge.Set = .bottom) -> some View {
         modifier(BoldTitleWithPadding(edges: edges))
    }
}
