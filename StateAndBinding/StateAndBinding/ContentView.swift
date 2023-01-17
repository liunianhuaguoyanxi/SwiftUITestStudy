//
//  ContentView.swift
//  StateAndBinding
//
//  Created by 张伟 on 2023/1/11.
//

import SwiftUI

struct ContentView: View {
    
    //    var isPlaying = false
    //    mutating func change(){
    //        isPlaying = true
    //    }
    //
    //
    //    mutating func change1(){
    //        change()
    //    }
    
    //   'mutating' may only be used on 'func' declarations
    /// mutating无法解决下述环境中修改属性的问题，引出了@state 和 @binding
    //   mutating var body: some View {
    //        Button {
    //            change()
    //        } label: {
    //
    //        }
    //
    //    }
    
    ///@state 修饰的对象 就可以修改她的属性，且如在UI中修改State修饰的属性就会修改它并会刷新当前UI的视图
    ///@state 一般只针对struct类型，但对class类型就不会刷新UI
    ///@state修饰的对象不会在当前的代码块里，而是被系统特殊的存在了其他地方，它修饰的对象就不属于当前类的属性了，所以@state修饰的属性还要用private修饰下,并给它初始值，防止它在外部被随意修改
    @State var isPlaying = false
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading) {
                Rectangle().fill(.black).frame(height: 300)
               PlayerButton(isPlaying: $isPlaying)

            }
            Text(isPlaying ? "播放中" : "准备中").font(.largeTitle)
                .foregroundColor(.white)
        }
        
        
    }
    
//    var playerButton : some View {
//        Button {
//            //                if isPlaying{
//            //                    isPlaying = false
//            //                }else {
//            //                    isPlaying = true
//            //                }
//            //                等价于isPlaying.toggle()
//            isPlaying.toggle()
//        } label: {
//            Image(systemName: isPlaying ? "pause.circle":"play.circle")
//            //                Text(isPlaying ? "暂停" :"播放").font(.largeTitle)
//        }
//        .font(.largeTitle)
//        .foregroundColor(.white)
//        .padding()
//    }
}

///跨越代码块传值 如果父类有@State修饰需要在子视图用@Binding修饰父视图的传参属性，在用$传参,因为Binding修饰的参数意思是需要传本身而不是复制过得，所以要用$修饰，$意思是取对象本身，而且被$修饰的，当它修改后，当前页面所有的值都会变并会刷新
///

struct PlayerButton :View{
    @Binding  var isPlaying: Bool
    var body: some View{
        Button {
            //                if isPlaying{
            //                    isPlaying = false
            //                }else {
            //                    isPlaying = true
            //                }
            //                等价于isPlaying.toggle()
            isPlaying.toggle()
        } label: {
            Image(systemName: isPlaying ? "pause.circle":"play.circle")
            //                Text(isPlaying ? "暂停" :"播放").font(.largeTitle)
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
        
    }
}


//当子视图嵌套的话，也是同样要用@Binding 来修饰,传的值也用$修饰，如下
//当子视图对应的值有所变动，它父视图所有对应的值和视图也会刷新
//@Binding相当于同步，双向绑定，视图和数据同步
//单一数据源（single source of truth，SSOT）概念
//即数据源只有一个，以isplayeing为例，以后不管有多少个isPlaying，最终使用的数据源都是父视图定义好的那个isPlaying属性
struct PlayerButton1 :View{
    @Binding  var isPlaying: Bool
    var body: some View{
        PlayerButton2(isPlay: $isPlaying)
        
    }
}

struct PlayerButton2 :View{
    @Binding  var isPlay: Bool
    var body: some View{
        Button {
        } label: {
            Image(systemName: isPlay ? "pause.circle":"play.circle")
            //                Text(isPlay ? "暂停" :"播放").font(.largeTitle)
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
        
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
