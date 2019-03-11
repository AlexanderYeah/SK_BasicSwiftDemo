//
//  CollectionHeader.swift
//  SK_Collection
//
//  Created by coder on 2019/3/8.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class CollectionHeader: UICollectionReusableView {
    
    var titleLbl = UILabel();
    
    override init(frame: CGRect) {
        super.init(frame:frame);
        self.titleLbl.frame = CGRect(x: 20, y: 10, width: 250, height: 35);
        self.titleLbl.textColor = UIColor.purple;
        self.titleLbl.text = "diyif";
        self.titleLbl.font = UIFont(descriptor: UIFontDescriptor.init(), size: 20);
        
        self.addSubview(self.titleLbl);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
