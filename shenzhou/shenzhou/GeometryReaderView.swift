//
//  GeometryReaderView.swift
//  shenzhou
//
//  Created by 张伟 on 2023/2/26.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        VStack{
            //获取父视图的宽高用GeometryReader，GeometryReader放在最外层就是获取屏幕的宽高
            GeometryReader{ proxy in
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: proxy.size.width/2, height: proxy.size.height/2)
            }

        }
//        .frame(width: 300,height: 300)
        .background(.green)
//        .ignoresSafeArea()
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
