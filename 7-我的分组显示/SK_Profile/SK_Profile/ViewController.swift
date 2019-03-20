//
//  ViewController.swift
//  SK_Profile
//
//  Created by coder on 2019/3/18.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableview:UITableView?;
    let screen_w = UIScreen.main.bounds.size.width;
    let screen_h = UIScreen.main.bounds.size.height;
    
    // 加载数据源数据源数组
    fileprivate var modelArr:[[String:Any]]{
        get{
            return ModelData.loadData();
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 创建UI
        self.createUI()
    }
    
    
    
    
    func createUI()->()
    {
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: screen_w, height: screen_h), style: UITableView.Style.plain);
        tableview?.delegate = self as? UITableViewDelegate;
        tableview?.dataSource = self as? UITableViewDataSource;
        tableview?.backgroundColor = Common.color.white;
        tableview?.rowHeight = 66;
 
        tableview?.separatorStyle = .none;
        tableview?.register(UINib.init(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell");
        
        self.view.addSubview(tableview!);
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    
    // group header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30;
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view:UIView = UIView(frame: CGRect(x: 0, y: 0, width: screen_w, height: 30));
        view.backgroundColor = UIColor.white;
        return view;
    }
    
    
    // section count
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelArr.count;
    }
    
    
    // row count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionDic:[String:Any] = modelArr[section];
        let rowArr:[[String:Any]] =  sectionDic["row"] as! [[String : Any]];
        
        return rowArr.count;
    }
    
    // cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ProfileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell;
        cell.selectionStyle = .none;
        
        let sectionDic:[String:Any] = modelArr[indexPath.section];
        let rowArr:[[String:Any]] =  sectionDic["row"] as! [[String : Any]];
        
        let dic:[String:Any] = rowArr[indexPath.row];
        
        let title:String =  dic["title"] as! String;
        let icon:String = dic["icon"] as! String;
        let navImg:String = dic["navImg"] as! String;
        
        cell.iconImgView?.image = UIImage.init(named: icon);
        cell.titleLbl?.text = title;
        cell.navImgView?.image = UIImage.init(named: navImg);
        
        
        return cell;
    }
    
}



