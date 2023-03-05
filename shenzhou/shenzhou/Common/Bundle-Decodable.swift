//
//  Bundle-Decodable.swift
//  shenzhou
//
//  Created by 张伟 on 2023/3/5.
//

import Foundation

//对Bundel对象进行拓展
extension Bundle{
    func decide<T:Codable>(file: String) -> [T] {
        

            guard let url = Bundle.main.url(forResource: file, withExtension: "json") else{
                fatalError("没在项目里面找到\(file)文件")//如果失败则闪退并打印内容
            }
            guard let data = try? Data(contentsOf: url) else{
                fatalError("加载\(file)文件失败")
            }
            
            let decoder = JSONDecoder()
            
            guard let datas = try? decoder.decode([T].self, from: data) else{
                fatalError("\(file)文件JSON解码失败")
            }
            
            return datas
        
    }
}
