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
    
    // 模型数组
    var modelArr:[PhotoItem]? = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // 加载数据
        let imgArr:NSArray = ["http://pic.58pic.com/58pic/15/68/59/71X58PICNjx_1024.jpg","http://pic1.nipic.com/2008-12-30/200812308231244_2.jpg","http://d.hiphotos.baidu.com/lvpics/w=1000/sign=e2347e78217f9e2f703519082f00eb24/730e0cf3d7ca7bcb49f90bb1b8096b63f724a8aa.jpg","http://pic9.nipic.com/20100824/2531170_082435310724_2.jpg","http://img.daimg.com/uploads/allimg/110825/3-110R5133545427.jpg","http://gss0.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/lvpics/w=1000/sign=a669f57d3a12b31bc76cc929b628377a/503d269759ee3d6d801feef140166d224f4ade2b.jpg"];
        for idx in 0 ..< imgArr.count {
            // 创建模型 加入数组
            let str = "图片".appending("\(idx)");
            let p:PhotoItem! = PhotoItem(faceImgUrl:  imgArr.object(at: idx) as! String, title: str);
            modelArr?.insert(p, at: idx);
        }
        
        
        tableview = UITableView(frame: CGRect(x: 0, y: 100, width: Screen_Width, height: Screen_Height - 100));
        tableview.delegate = self as UITableViewDelegate;
        tableview.dataSource = self as UITableViewDataSource;
        self.view.addSubview(tableview);
        // 自定义cell
        
        tableview.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier:"TableViewCell");
        
        tableview.reloadData();
        
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
        
        let item = modelArr?[indexPath.row];
        cell?.titleLbl.text = item?.title;
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int
    {
        return modelArr?.count ?? 0;
    }
    
}

