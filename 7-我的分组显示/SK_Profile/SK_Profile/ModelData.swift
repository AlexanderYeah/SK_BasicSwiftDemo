//
//  ModelData.swift
//  SK_Profile
//
//  Created by coder on 2019/3/20.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import Foundation
public struct ModelData
{
    static func loadData()->[[String:Any]]{
        
        return [
            // 外层是section 数组
            // 第一个section
            [
                "row":[["title":"我的","icon":"666","navImg":"right_arrow"]]
            ],
            // 第二个section
            [
                "row":[["title":"版本","icon":"111","navImg":"right_arrow"],
                ["title":"朋友圈","icon":"222","navImg":""],
                ["title":"设置","icon":"333","navImg":"right_arrow"],
                ["title":"发现","icon":"444","navImg":"right_arrow"],
                ["title":"电话","icon":"555","navImg":"right_arrow"],
                ["title":"收藏","icon":"666","navImg":""]
                ]
            ],
            // 第三个section
            [
                "row":[["title":"奖品","icon":"777","navImg":"right_arrow"]]
            ]
            
            
            
        ];
    }
    
}
