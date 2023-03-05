//
//  SZDvider.swift
//  shenzhou
//
//  Created by 张伟 on 2023/3/5.
//

import SwiftUI

struct SZDvider: View {
    var color = kLightBGColor
    var width: CGFloat = 2.0
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .padding(.vertical)
    }
}

struct SZDvider_Previews: PreviewProvider {
    static var previews: some View {
        SZDvider()
    }
}
