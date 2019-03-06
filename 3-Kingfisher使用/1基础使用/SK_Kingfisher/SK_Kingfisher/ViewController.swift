//
//  ViewController.swift
//  SK_Kingfisher
//
//  Created by coder on 2019/3/6.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit
import Kingfisher
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let imgViewA = UIImageView(frame: CGRect(x: 100, y: 200, width: 150, height: 150));
        self.view.addSubview(imgViewA);
        
        
        
        // 最为简单的使用方式
        let url = URL(string: "http://t2.hddhhn.com/uploads/tu/201610/198/scx30045vxd.jpg");
        // 等待指示器
        imgViewA.kf.indicatorType = .activity;
        // 展示的方式fadein
        imgViewA.kf.setImage(with: url,options:[.transition(.fade(0.5))]);
        
 
        
        // 设置超时时间
        let downloader = KingfisherManager.shared.downloader;
        // 超时时间
        downloader.downloadTimeout = 1;
        
        // 获取缓存代销
        let cache  = KingfisherManager.shared.cache;
        // 设置最大缓存为多少 100M  默认是无上限
        cache.maxMemoryCost = 100 * 1024 * 1024;
        // 设置保存时间 1天 默认一周
        cache.maxCachePeriodInSecond = 1 * 60 * 60 * 24;
        
        
        
        
            
        
        
    }


}

