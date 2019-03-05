//
//  ViewController.swift
//  AlamofileDemo
//
//  Created by Alex on 2019/3/5.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit
import Alamofire


// 遵守协议方法
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    var tableview:UITableView = UITableView();
    let Screen_Width = UIScreen.main.bounds.size.width;
    let Screen_Height = UIScreen.main.bounds.size.height;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableview = UITableView(frame: CGRect(x: 0, y: 100, width: Screen_Width, height: Screen_Height - 100));
        tableview.delegate = self as UITableViewDelegate;
        tableview.dataSource = self as UITableViewDataSource;
        self.view.addSubview(tableview);
        // 自定义cell
        
        tableview.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier:"TableViewCell");
        
    }
    
    
    
// UITableViewDataSource 数据源
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell" ) as? TableViewCell;
        
        if cell == nil {
            cell = TableViewCell(style: .default, reuseIdentifier: "TableViewCell");
        }
        cell?.selectionStyle = .none;
        cell?.titleLbl?.text = "123456";
        return cell!;
    }
    
    func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int
    {
        return 5;
    }
    
}

