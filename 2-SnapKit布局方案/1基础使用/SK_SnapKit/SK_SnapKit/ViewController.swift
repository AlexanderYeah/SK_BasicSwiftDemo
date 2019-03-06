//
//  ViewController.swift
//  SK_SnapKit
//
//  Created by coder on 2019/3/6.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1 创建一个View 居中在当前视图
        let viewA = UIView();
        viewA.backgroundColor = UIColor.cyan;
        self.view.addSubview(viewA);
        viewA.snp.makeConstraints { (make) in
            make.width.equalTo(250);
            make.height.equalTo(250);
            make.center.equalTo(self.view.center);

        };
        
        // 更为简洁的语法
        viewA.snp.makeConstraints { (make) in
            // 宽高相等的操作
            make.width.height.equalTo(250);
            // 对于父视图居中操作
            make.center.equalToSuperview();
        }
        
        // 2 相对父视图Offset
        let viewB = UIView();
        viewB.backgroundColor = UIColor.orange;
        viewA.addSubview(viewB);
        viewB.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-50);
            make.left.equalToSuperview().offset(50);
            make.width.height.equalTo(50);
        };
        
        
        

        // 3 竖直水平线相等操作
        // lessThanOrEqualTo <= 操作
        let viewC = UIView();
        viewC.backgroundColor = UIColor.blue;
        viewA.addSubview(viewC);
        viewC.snp.makeConstraints { (make) in
            make.centerX.lessThanOrEqualTo(viewB.snp.left);
            make.top.equalToSuperview().offset(20);
            make.width.height.equalTo(60);
            
        }
        
        // 4 优先级设置（优先级不能大于1000，大于1000会crash）
        // 优先级高的有效执行代码
        let viewD = UIView();
        viewD.backgroundColor = UIColor.purple;
        viewA.addSubview(viewD);
        viewD.snp.makeConstraints { (make) in
            make.width.equalTo(30).priority(100);
            make.width.equalTo(60).priority(200);
            make.height.equalTo(40);
            make.right.equalToSuperview().offset(-20);
            make.top.equalToSuperview().offset(10);
        }
        
        
        
        
        
        
        
        
        
        
    }


}

