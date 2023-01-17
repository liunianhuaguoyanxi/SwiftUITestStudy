import UIKit
import SwiftUI

struct Person{
    var name = "张三"
    mutating func setName(newName: String){
        name = newName
    }
}

var person = Person()
person.setName(newName: "李四")


///  在值类型的结构体中，属性是不能直接被修改的，相当于一张A4的纸质文件，不能再上面乱涂乱画
///   mutating  修饰下相当于是复印了这张纸，可以在这张纸上进行编辑，然后在覆盖掉之前的那份A4文件，这样就可以间接的修改属性了
///

///同理
//struct ContentView: View
//{
//    var a = 1
//    var bady: some View{
//        Text("Hellow,word")
//            .padding()
//    }
//}
///要修改a的属性，也应该要用mutating来处理，但是SwiftUI中一般在body中进行修改，但是body不允许在前面加mutating，
//  mutating 只能修饰 func 不能修饰var
///  所以引出了@state 和 @binding
