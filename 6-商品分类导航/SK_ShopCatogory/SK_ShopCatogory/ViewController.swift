//
//  ViewController.swift
//  SK_ShopCategory
//
//  Created by coder on 2019/3/14.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {
    var tableview:UITableView?;
    var collectionView:UICollectionView?;
    var screen_w = UIScreen.main.bounds.size.width;
    var screen_h = UIScreen.main.bounds.size.height;
    // 左边的导航栏数据
    var leftItemArr:[LeftItemModel] = [];
    var rightModelArr:[CollectCateModel] = [];
    
    // 左边栏选中的索引变化
    var selectedIdx:Int = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 0 加载数据
        self.loadData()
        // 1 创建UI
        self.createUI();
    }
    
    // 0装载数据
    func loadData() -> () {
        
        // 左边栏的数据
        let array:Array = ["AAA","BBB","CCC","DDD","EEE","FFF","GGG","HHH","III","JJJ","KKK","OOO","PPP","QQQ","RRR","SSS","TTT","UUU"];
        
        
        for i in 0 ..< array.count{
            
            let model:LeftItemModel = LeftItemModel(cateTitle: array[i]);
            model.isSelected = false;
            if i == 0 {
                model.isSelected = true;
            }
            self.leftItemArr.insert(model, at: i);
        }
        
        // 静态方法加载右边的数据
        self.rightModelArr = CateData.loadDataFromBundle();
        
    }
    
    // 1创建UI
    func createUI() -> () {
        
        // tableview
        self.tableview = UITableView(frame: CGRect(x: 0, y: 84, width: 120, height:screen_h - 44), style: UITableView.Style.plain);
        // 行高 行宽
        self.tableview?.rowHeight = 60;
        self.tableview?.delegate = self as? UITableViewDelegate;
        self.tableview?.dataSource = self as? UITableViewDataSource;
        self.view.addSubview(self.tableview!);
        self.tableview?.separatorStyle = .none;
        self.tableview?.register(UINib(nibName:"CategoryLeftCell", bundle: nil), forCellReuseIdentifier:"CategoryLeftCell");
        
        // collectionview
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        
        
        let item_w = (screen_w - 120 - 20) / 3 ;
        let item_h = CGFloat(100);
        layout.itemSize = CGSize(width: item_w, height: item_h);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10);
        layout.scrollDirection = .vertical;
        self.collectionView = UICollectionView(frame: CGRect(x: 120, y: 84, width: screen_w - 120, height: screen_h - 84), collectionViewLayout: layout);
        // 头部高度
        layout.headerReferenceSize = CGSize(width:  screen_w - 120, height: 40);
        
        self.collectionView?.backgroundColor = UIColor.white;
        self.collectionView?.delegate = self as? UICollectionViewDelegate;
        self.collectionView?.dataSource = self as? UICollectionViewDataSource;
        self.view.addSubview(self.collectionView!);
        self.collectionView?.register(UINib.init(nibName: "RightCollectionCell", bundle: nil), forCellWithReuseIdentifier: "RightCollectionCell");
        self.collectionView?.register(UINib.init(nibName: "RightCollectHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "RightCollectHeader");
    }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CategoryLeftCell = self.tableview?.dequeueReusableCell(withIdentifier:"CategoryLeftCell") as! CategoryLeftCell;
        
        if self.leftItemArr.count > indexPath.row {
            let model:LeftItemModel = self.leftItemArr[indexPath.row];
            cell.titleLbl.text = model.cateTitle;
            
            if model.isSelected{
                cell.titleLbl.font = UIFont.init(name:"", size: 20);
                cell.titleLbl.textColor = UIColor.red;
                cell.indicatorView.isHidden = false;
                cell.backgroundColor = UIColor.init(red: 230/255, green: 230/255, blue: 230/255, alpha: 1);
            }else{
                cell.titleLbl.font = UIFont.init(name:"", size: 20);
                cell.titleLbl.textColor = UIColor.black;
                cell.indicatorView.isHidden = true;
                cell.backgroundColor = UIColor.white;
            }

            
        }
        
        cell.selectionStyle = .none;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leftItemArr.count;
    }
    
    // 点击效果
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 将选中的item 置位true
        for item in self.leftItemArr{
            item.isSelected = false;
        }
        
        let model = self.leftItemArr[indexPath.row];
        model.isSelected = true;
        self.tableview?.reloadData();
        
        // 更新选中的索引 更新右边collection的数据源
        self.selectedIdx = indexPath.row;
        self.collectionView?.reloadData();
        
    }
 
}


// UICollectionViewDataSource
extension ViewController:UICollectionViewDataSource
{
    
    // section 数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        let model =  self.rightModelArr[self.selectedIdx];
        return model.childItems.count;
    }
    
    //
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let model =  self.rightModelArr[self.selectedIdx];
        let model2:CollectItemModel = model.childItems[section];
        print(model2.itemArr?.count ?? 0);
 
        return model2.itemArr?.count ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:RightCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RightCollectionCell", for: indexPath) as! RightCollectionCell;
        
        let model =  self.rightModelArr[self.selectedIdx];
        let model2:CollectItemModel = model.childItems[indexPath.section];
        let dic:Dictionary = model2.itemArr?[indexPath.row] as! [String:String]
        cell.titleLbl.text = dic["name"];
        let imgStr:String = dic["image"] as! String;
        let url:URL! = URL(string: imgStr);
        
        cell.faceImgView.kf.setImage(with: url)
 
//      cell.backgroundColor = self.randomColor();
        return cell;
    }
    
    // 头部
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "RightCollectHeader", for: indexPath);
        
            return header;
        }
        return UIView() as! UICollectionReusableView;
    }
    
    
    func randomColor()->UIColor{
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
}



