//
//  ViewController.swift
//  SK_Collection
//
//  Created by coder on 2019/3/8.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var collection:UICollectionView?;
    
    let screen_width = UIScreen.main.bounds.size.width;
    let screen_height = UIScreen.main.bounds.size.height;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createUI();
        
    }
    
    // 创建UI
    func createUI() -> () {
        
        // 初始化一个 UICollectionViewFlowLayout 布局
        let flowLayout = UICollectionViewFlowLayout.init();
        flowLayout.scrollDirection = .vertical;
        let item_w = (screen_width - 80) / 3 ;
        let item_h = CGFloat(150);
        flowLayout.itemSize = CGSize(width: item_w, height: item_h);
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.minimumLineSpacing = 20;
        // 上下左右边距
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20);
        self.collection = UICollectionView(frame: CGRect(x: 0, y: 100, width: screen_width, height: screen_height - 100), collectionViewLayout: flowLayout);
        
        // 创建collectionView
        self.collection?.delegate = self as? UICollectionViewDelegate;
        self.collection?.dataSource = self as? UICollectionViewDataSource;
        self.collection?.backgroundColor = UIColor.white;
        self.collection?.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "UICollectionViewCell");
        self.view.addSubview(self.collection!);
        

        // 设置header footer 高度
        flowLayout.headerReferenceSize = CGSize(width: screen_width, height: 50);
        
        flowLayout.footerReferenceSize = CGSize(width: screen_width, height: 50);
        
        self.collection?.register(CollectionHeader.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header");
        self.collection?.register(CollectionHeader.classForCoder(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer");
        
        
    }


}


extension ViewController:UICollectionViewDataSource{
    
    //返回cell 数量
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    
    // 返回cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath);
        
        cell.backgroundColor = randomColor();
        
        return cell;
    }
    
    // 返回header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 如果是头部视图
        if kind == UICollectionView.elementKindSectionHeader{
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! CollectionHeader;
            header.titleLbl.text = "头部\(indexPath.section)区";
            header.backgroundColor = UIColor.white;
            return header;
        }else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "footer", for: indexPath) as! CollectionHeader;
            footer.titleLbl.text = "尾部\(indexPath.section)区";
            footer.backgroundColor = UIColor.white;
            return footer;
        }
        
    }
    
    // 返回header 高度
   
    
    
    func randomColor()->UIColor{
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    
}

