//
//  CategoryLeftCell.swift
//  SK_ShopCategory
//
//  Created by coder on 2019/3/14.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class CategoryLeftCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
