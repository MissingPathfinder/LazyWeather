//
//  ViewController.swift
//  LazyWeather
//
//  Created by Dali Lin on 16/4/9.
//  Copyright © 2016年 Rain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mywebview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //uiview属性设置
        let url = NSURL(string:"https://baidu.com")
        let request = NSURLRequest(URL: url!)
        self.mywebview.loadRequest(request)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

