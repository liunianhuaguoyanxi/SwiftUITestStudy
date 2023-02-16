import UIKit

var greeting = "Hello, playground"

func simpleMax(x:Int,y:Int) -> Int{
    x < y ? y: x
}

simpleMax(x:1,y:2)

func simpleMax(x:Double,y:Double) -> Double{
    x < y ? y: x
}
simpleMax(x: 1.2, y: 2.4)

//Equatable == !=  该协议下可以进行等于和不等于比较
//Comparable > <   该协议下可以进行大于和小于比较

//泛型 T 指同种类型 一开始没有确认下来  可提高代码复用性 实际使用中自动确认
//泛型函数
func simpleMax<T:Comparable>(x:T,y:T)-> T{
    x < y ? y: x
}

simpleMax(x: 1.2, y: 2.4)
simpleMax(x: 3, y: 4)
simpleMax(x: 1.2, y: 2.4)

func simpleMax<T:Comparable ,U:Equatable>(x:T,y:T,z:U) -> T{
    x < y ? y: x
}


//定义数组 ,下面写法都行
//Array<Element> 也是泛型类型 相当于Array<T> element只是让代码更可读
let a:Array<Int> = [1,2]
let b:[Int] = [1,2]
let c:Dictionary<Int,Int>=[1:2]
let d:[Int:Int]=[1:2]


class Todo{
    var name = ""
    var age = 18
}

struct IntModel{
    var items:[Int] = []
    mutating  func add(_ item: Int){
        items.append(item)
    }
}

//IntModel().items
//IntModel().add(3)

var intModel = IntModel()
intModel.add(3)

//如果是double类型，就重复了不太好，可以用泛型解决
//struct IntModel{
//    var items:[Double] = []
//    mutating  func add(_ item: Double){
//        items.append(item)
//    }
//}

//这样就可以支持多种格式模式
//struct model<Element>{
//    var items:[Element] = []
//    mutating func add(_ item: Element){
//        items.append(item)
//    }
//}

//var model1 = model<Int>()
//model1.add(3)
//
//var model2 = model<Double>()
//model2.add(2.4)


//类型约束-- 让类型是某种父类的子类或者是遵循某种协议
//简单
struct model<Element:Comparable>{
    var items:[Element] = []
    mutating func add(_ item: Element){
        items.append(item)
    }
}
//复杂点的 用where子句
//换种写法
//struct model<Element> where Element: Comparable{
//    var itmes:[Element] = []
//    mutating func add(_ item: Element){
//        itmes.append(item)
//    }
//}

//复杂点的 用where子句 where后面增加约束 sequence协议下面类型的泛型再增加约束 即遵守Equatable协议
struct ModelX1<S:Sequence> where S.Iterator.Element:Equatable{
    
}
//复杂点的 用where子句 where后面增加约束 sequence协议下面类型的泛型再增加约束 即两个要相等
struct ModelX2<S1:Sequence,S2:Sequence> where S1.Iterator.Element == S2.Iterator.Element{
    
}

//上诉中的T Element等等都叫类型参数，最好取有意义的名字，他们都是泛型，如果无法确认有意义的名字就默认用T或者U


