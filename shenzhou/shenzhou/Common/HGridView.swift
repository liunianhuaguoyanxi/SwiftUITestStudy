//
//  HGridView.swift
//  shenzhou
//
//  Created by 张伟 on 2023/2/26.
//

import SwiftUI

struct HGridView: View {
    var body: some View {                      //每行的高度
//        let columns = Array(repeating: GridItem(.fixed(100)), count: 3)
//        ScrollView([.horizontal,.vertical], showsIndicators: true){
//            Image
//        }
        let rows = [GridItem()]
        GeometryReader{ proxy in
//            proxy.frame(in: .local).x  获取坐标
            ScrollView(.horizontal){
                LazyHGrid(rows: rows) {
                    ForEach(0..<50){ index in
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
                            .frame( width:proxy.size.width * 0.3)//相当于centenView.frame 不指定则默认填充满
                            .overlay(Text("\(index)"))
                    }
                }
                .frame(height: proxy.size.width * 0.3)
            }
        }

    }
}

struct HGridView_Previews: PreviewProvider {
    static var previews: some View {
        HGridView()
    }
}
