//
//  ContentView.swift
//  ViewBuilder
//
//  Created by 张伟 on 2023/2/20.
//

import SwiftUI
//ViewBuilder可以让代码更灵活，属性包装器
//作用：可以在它修饰的view中放入多个视图
//如在一些UI控件中不用让它的子控件再包一层VStack或者HStack等就可以使用了，因为这些UI控件已经由ViewBuilder修饰了
//如下面Group控件（单纯讲视图包起来，不进行具体的布局,实际使用中再用父视图进行布局）或者业务逻辑区分，注意Swift等控件单纯写入子视图最多只能写最多10个，可以用group来扩充

//struct ContentView: View {
//    var body: some View {
//        VStack{
//            childView
//        }
//        HStack{
//            childView
//        }
//    }
//
//    var childView: some View{
//        Group {
//            Text("111")
//            Text("111")
//            Text("111")
//        }.font(.headline)
//    }
//}

struct ContentView: View {
    var body: some View {
        //        Group{
        //            if isLoggedIn{}
        //            welComeView()
        //        }else{
        //            LoginView()
        //        }
        
        //
        //    var childView: some View{
        //        Group {
        //            Text("111")
        //            Text("111")
        //            Text("111")
        //        }.font(.headline)
        //    }
        VStack{
            Group {
                Text("1")
                Text("2")
                Text("3")
                Text("4")
                Text("5")
                Text("6")
                Text("7")
                Text("8")
                Text("9")
                Text("10")
//                Text("11")
            }
            Text("11")
        }

    }
}
//大写Self代表类型 如UIView，ContentView
//小写self代表当前的类 如ContentView初始化后的view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
