//
//  PhotoItem.swift
//  AlamofileDemo
//
//  Created by coder on 2019/3/6.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class PhotoItem: NSObject {
    
    var faceImgUrl:String?;
    var title:String?;
    
    init(faceImgUrl:String,title:String) {
        self.faceImgUrl = faceImgUrl;
        self.title = title;
    }
    
}
