//
//  VGridView.swift
//  shenzhou
//
//  Created by 张伟 on 2023/2/26.
//

import SwiftUI

struct VGridView: View {
    var body: some View {

        //自适应网格
        let adaptiveColums =
        //现实中开发用得最多的一般是一种的情况，主要自适应各种屏幕的手机和ipad
        [
            //系统会以最小50的宽度先排列 假设屏幕宽180 那么一航行就3个 但是剩了30  又会等份分给这三个，最后变成了3个60的
            GridItem(.adaptive(minimum: 50)),
        ]
//        [
//            //系统会先除以2，
//            //再以最小50的宽度先排列 假设屏幕宽180 那么一航行就3个 但是剩了30  又会等份分给这三个，最后变成了3个60的
//            //再以最小90的宽度先排列 假设屏幕宽180 那么一航行就2个
//            GridItem(.adaptive(minimum: 90)),
//            GridItem(.adaptive(minimum: 50)),
//
//        ]
        //        [
        //            //系统会以最小50的宽度先排列 假设屏幕宽180 那么一航行就3个 但是剩了30  又会等份分给这三个，最后变成了3个60的
        //            GridItem(.adaptive(minimum: 50)),
        //        ]
//        [
//            //系统会先分给固定的100，再把剩下的宽度以最小50的宽度先排列 假设屏幕宽180 那么一航行就3个 但是剩了30  又会等份分给这三个，最后变成了3个60的
//            GridItem(.adaptive(minimum: 50)),
//            GridItem(.fixed(100))
//        ]
//        [
//            //系统会先分成一半，再以最小50的宽度先排列 假设屏幕宽180 那么一航行就3个 但是剩了30  又会等份分给这三个，最后变成了3个60的
//            GridItem(.flexible()),
//            GridItem(.adaptive(minimum: 50)),
//
//        ]
//        [
//            //系统会先减去250的固定最小flexible，再以最小50的宽度先排列 假设屏幕宽180 那么一航行就3个 但是剩了30  又会等份分给这三个，最后变成了3个60的
//            GridItem(.flexible(minimum: 250)),
//            GridItem(.adaptive(minimum: 50)),
//
//        ]
        ScrollView{
                              //对齐方式              //每行间距
            LazyVGrid(columns: adaptiveColums,alignment: .leading ,spacing: 20) {
                ForEach(0..<50){ index in
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
                        .frame( height:50)//相当于centenView.frame 不指定则默认填充满
                        .overlay(Text("\(index)"))
                }

            }

        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        let colums =
//            [   //占满所有的可用空间 相当于spacer() 弹性布局
//                //弹性空间最小宽度
//                GridItem(.flexible(minimum: 200, maximum: 1000)),
//                GridItem(.flexible()),
//                GridItem(.fixed(100)),
//                //优先级先固定，再flexible设置的固定最小宽度 再flexible弹性布局
//            ]
//
//        ScrollView{
//                              //对齐方式              //每行间距
//            LazyVGrid(columns: colums,alignment: .leading ,spacing: 20) {
//                ForEach(0..<50){ index in
//                    RoundedRectangle(cornerRadius: 5)
//                        .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
//                        .frame( height:50)//相当于centenView.frame 不指定则默认填充满
//                        .overlay(Text("\(index)"))
//                }
//
//            }
//
//        }
        
        
        
        
//        let colums = Array(repeating: GridItem(.fixed(100)), count: 3)
//
//        ScrollView{                     //固定
//            LazyVGrid(columns: colums,  pinnedViews: [.sectionHeaders,.sectionFooters]) {
//                ForEach(0..<5){ index in
//                    Section {
//                        ForEach(0..<10){ idx in
//                            RoundedRectangle(cornerRadius: 5)
//                                .foregroundColor(Color(hue: 0.03 * Double(idx * 10 + index), saturation: 1, brightness: 1))
//                                .frame(height: 50)
//                                .overlay(Text("\(index * 10 + idx)"))
//                        }
//                    } header: {
//                        Text("header \(index + 1)").bold().font(.title)
//                            .frame(maxWidth: .infinity,alignment:.leading)
//                                   //占满父视图
//                    } footer: {
//                        Text("footer \(index + 1)").bold().font(.title)
//                            .frame(maxWidth: .infinity,alignment:.leading)
//                            .padding(.bottom)
//                    }
//
//
//                }
//            }.padding()
//        }
        
        
        
        
        //3列每列固定宽度100(相当于cell) 右边间距20 间距用的默认值
//        let colums = [GridItem(.fixed(100),spacing: 20),
//                      GridItem(.fixed(100),spacing: 20),
//                      GridItem(.fixed(100),spacing: 20),
//                      ]
//
//        ScrollView{
//                              //对齐方式              //每行间距
//            LazyVGrid(columns: colums,alignment: .center ,spacing: 20) {
//                ForEach(0..<50){ index in
//                    RoundedRectangle(cornerRadius: 5)
//                        .foregroundColor(Color(hue: 0.03 * Double(index), saturation: 1, brightness: 1))
//                        .frame(width: 50, height:50)//相当于centenView.frame 不指定则默认填充满
//                        .overlay(Text("\(index)"))
//                }
//
//            }
//
//        }
//scrollview + vgrid 或者 Hgrid == collectionView
        
        
        

//        VStack{
//            ForEach(0..<200){
//                Text("\($0)")
//            }
//        }
//        LazyVStack //只加载用户能看见的内容，即屏幕当前出现的内容
//        {
//            ForEach(0..<200){
//                Text("\($0)")
//            }
//        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        VGridView()
    }
}
