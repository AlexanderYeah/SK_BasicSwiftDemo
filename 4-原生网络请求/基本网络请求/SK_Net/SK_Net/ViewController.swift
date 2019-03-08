//
//  ViewController.swift
//  SK_Net
//
//  Created by coder on 2019/3/8.
//  Copyright © 2019 AlexanderYeah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getMethod();
        postMethod();
    }
    
    // URLRequest 请求类 设置一些请求的属性例如请求头和请求体
    // URLSession 会话类 负责请求 上传 下载三种通讯方式
    
    // MARK1:GET 请求
    private func getMethod() -> () {
        // 0 构建请求
        let url = URL(string:"https://itunes.apple.com/lookup?id=asd")
        let req = URLRequest(url: url!, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 2);
        
        // 1 获取会话 构建任务
        let session = URLSession.shared;
        
        let task = session.dataTask(with: req) { (data, response, error) in
            
            // 如果返回数据为空 直接返回
            if data == nil {
                return;
            }
            
            // 获取响应状态吗
            let rep1 : HTTPURLResponse = response as! HTTPURLResponse;
            print(rep1.statusCode);
            // json 字符串
            let str = String(bytes: data!, encoding: String.Encoding.utf8);
            print(str as Any);
            
        };
        
        // 2 开启任务
        task.resume();
        
    }
    
    // MARK2:POST 请求
    private func postMethod() ->(){
        let url = URL(string:"https://itunes.apple.com/lookup?id=asd");
        
        var req = URLRequest(url: url!, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 2);
        // 设置请求方式
        req.httpMethod = "POST";
        // 设置请求头
        req.setValue("", forHTTPHeaderField: "Content-Type");
        // 设置请求体
        let params = NSMutableDictionary(capacity: 0);
        params.setValue("1", forKey: "time");
        // 参数字典转成字符串
        req.httpBody = getBodyStr(params: params).data(using: String.Encoding.utf8);
        
        let session = URLSession.shared;
        let task = session.dataTask(with: req) { (data, response, error) in
            
            let resp1:HTTPURLResponse = response as! HTTPURLResponse;
            print(resp1.statusCode);
            
        };
        
        
        task.resume();
        
    
    }
    
    func getBodyStr(params:NSMutableDictionary) -> String {
        var str:String = "";
        for (key,value) in params {
            let tempStr:String = "\(key)=\(value)&";
            str += tempStr;
        }
        
        if params.count > 0 {
            str = String(str[str.startIndex ..< str.index(str.endIndex, offsetBy: -1)]);
        }
        
        print(str);
        return str;
    }
    
    
}

