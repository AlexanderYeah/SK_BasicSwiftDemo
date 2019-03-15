//
//  CateData.swift
//  SK_ShopCategory
//
//  Created by coder on 2019/3/15.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class CateData: NSObject {
    
    // 静态方法加载本地的数据
    static func loadDataFromBundle() ->[CollectCateModel]
    {
        
        // 保存结果的数据
        var childItems = [CollectCateModel]();
        
        // 验证是否找到本地json 文件
        guard let url = Bundle.main.url(forResource: "cate", withExtension: "json") else {
            return childItems;
        }
        
        
        // do catch 只有do中的代码发生了错误, 才会执行catch{}中的代码
        do{
            // 本地json 数据
            let data = try Data(contentsOf: url);
            // 获取json 数据 转化为字典
            guard let rootObj = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:AnyObject] else {
                return childItems;
            }
                        
            // 获取第一级的数组
            guard let cateObj = rootObj["categorys"] as? [[String: AnyObject]] else {
                return childItems;
            }
            
            // 遍历数组
            for item in cateObj {
                
                let model:CollectCateModel = CollectCateModel(title: item["title"] as? String ?? "暂无");
                // 建立模型
                let array = item["childCategory"] as? [[String:AnyObject]] ?? [[:]];
                var childModelArr = [CollectItemModel]();
                for child in array{
                    let name = child["childTitle"] as? String ?? "暂无";
                    let itemArr = child["childItems"] as? [[String:AnyObject]] ?? [[:]];
                    let childModel:CollectItemModel = CollectItemModel(name:name);
                    childModel.itemArr = itemArr;                    
                    childModelArr.append(childModel);
                }
                
                model.childItems = childModelArr;
                // 装进结果数组
                childItems.append(model);
            }
            
            print(cateObj);
            
        }catch{
            return childItems;
        }
        
        return childItems;
        
    }
    
    
}
