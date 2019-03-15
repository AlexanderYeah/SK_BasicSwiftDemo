//
//  LeftItemModel.swift
//  SK_ShopCategory
//
//  Created by coder on 2019/3/14.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class LeftItemModel: NSObject {
    
    var cateTitle:String = "";
    var isSelected:Bool = false;
    
    convenience init(cateTitle:String) {
        
        self.init();
        self.cateTitle = cateTitle;
    }
    
}
