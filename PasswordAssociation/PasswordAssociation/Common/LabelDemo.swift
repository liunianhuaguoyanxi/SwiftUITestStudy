//
//  LabelDemo.swift
//  PasswordAssociation
//
//  Created by 张伟 on 2023/2/26.
//

import SwiftUI

struct LabelDemo: View {
    var body: some View {
        VStack(spacing: 20) {
//            Label("晴天",systemImage: "sun.max")
//                .font(.largeTitle)
//            .labelStyle(.titleAndIcon)//强制指定图标和文本都显示
//            //默认在button中不显示文本，他文本会作为辅助功能
            
            Label{
                Text("df")
                Text("344")
            } icon: {
                Circle().fill(.green)
                    .frame(width: 55,height: 55)
                    .overlay (
                    Text("l")
                    .font(.title).foregroundColor(.white)
                )

                }
            }
        }

}

struct LabelDemo_Previews: PreviewProvider {
    static var previews: some View {
        LabelDemo()
    }
}
