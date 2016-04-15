//
//  CenterVC.swift
//  LazyWeather
//
//  Created by Dali Lin on 16/4/12.
//  Copyright © 2016年 Rain. All rights reserved.
//

import UIKit
import Alamofire

class CenterVC: UIViewController {

    @IBOutlet weak var weatherData: UILabel!
    
    
//    func getWeatherData() {
//         as! String
//        return
//    }
    
    private var mweatherAPI = "http://api.k780.com:88/?app=weather.today&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json"
    
    private var mweatherData : NSDictionary? {   //optional
        didSet {
            //let todayWeather = mweatherData?.objectAtIndex(0) as! NSDictionary
            
            let todayWeather = mweatherData?.valueForKey("weather")
            
            let city = (mweatherData?.objectForKey("citynm"))!
            let templow = mweatherData?.objectForKey("temp_low")
            let templowhigh = mweatherData?.objectForKey("temp_high")
            
            self.weatherData.text = "\(todayWeather!)  \(city)  \(templow!) \(templowhigh!)"
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //request data
        
        Alamofire.request(.GET, mweatherAPI)
            .responseJSON { response in
                let jsondata = response.result.value as! NSDictionary  // 取对象
                let result = jsondata.valueForKey("result") as! NSDictionary
                
                print(result.valueForKey("cityid"))
                
                self.mweatherData = result
        }

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    @IBAction func LeftBtn(sender: AnyObject) {
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appdelegate.toggleLeftDrawer(sender, animated: true)
    }
    
    @IBAction func RightBtn(sender: AnyObject) {
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appdelegate.toggleRightDrawer(sender, animated: true)
    }
    
    //private func
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }