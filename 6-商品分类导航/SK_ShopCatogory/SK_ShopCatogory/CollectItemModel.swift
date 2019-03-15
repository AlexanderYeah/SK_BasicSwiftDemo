//
//  CollectItemModel.swift
//  SK_ShopCategory
//
//  Created by coder on 2019/3/15.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class CollectItemModel: NSObject {
    
    var name:String?;
    var itemArr:Array? = [];
    convenience init(name:String) {
        self.init();
        self.name = name;
    }        
    
}
