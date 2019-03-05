//
//  TableViewCell.swift
//  AlamofileDemo
//
//  Created by Alex on 2019/3/5.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit



class TableViewCell: UITableViewCell {

    @IBOutlet weak var faceImgView: UIImageView!
    
    
    @IBOutlet weak var titleLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
