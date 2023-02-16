import UIKit

//协议中使用泛型要用associatedtype来表示而不是用<T>,其他地方都相同
//protocol ModelProtocol{
//    associatedtype Item:Sequence where Item.Iterator.Element:Equatable
//    func add(_ items:Item)
//
//}
protocol ModelProtocol{
    associatedtype Item
    var count: Int{get} //协议中定义一个属性,要说明它可读可写，要么可读get，要么可写set
    mutating  func add(_ items:Item)

}

//协议里的泛型也叫关联类型，定义的时候还不能确定类型，使用的时候才能确认
//使用上诉协议
struct Model: ModelProtocol{
//    typealias Item = Int //大括号里面所有Item类型都是Int类型 add 等价于add1 ，一般不怎么用 仅了解，因为系统会自己推断，不需要再这里写了
//    func add1(_ items: Item) {
//
//    }
    
//    var count: Int
//    func add(_ items: Int) {
//
//    }
    
    var items:[Int] = []
    var count: Int{items.count
        
    }
    mutating  func add(_ item:Int){
        items.append(item)
    }
    
}


