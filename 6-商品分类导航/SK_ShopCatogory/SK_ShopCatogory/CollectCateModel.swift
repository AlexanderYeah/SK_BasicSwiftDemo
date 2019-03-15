//
//  CollectCateModel.swift
//  SK_ShopCategory
//
//  Created by coder on 2019/3/15.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class CollectCateModel: NSObject {
    
    var title:String?
    var childItems:[CollectItemModel] = [];
    
    convenience init(title:String) {
        self.init();
        self.title = title;        
    }

}
