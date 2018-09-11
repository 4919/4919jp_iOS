//
//  TodayMenuViewController.swift
//  jp4919
//
//  Created by shogo-ka on 2018/07/28.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import UIKit
import MBProgressHUD

class TodayMenuViewController: UIViewController {
    @IBOutlet weak var naviTitle: UINavigationItem!
    
    let userdefaults = UserDefaults.standard
    
    var distributorId = ""
    var mbHUD = MBProgressHUD()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        naviTitle.title = userdefaults.string(forKey: .schoolName)!
    }
    
    
    @IBAction func onTapSettingButton(_ sender: Any) {
        let settingNaviVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingNaviVC") as! SettingNavigationViewController
        self.present(settingNaviVC, animated: true, completion: nil)
    }
    
    @IBAction func resetAreaSettingBtn(_ sender: Any) {
        userdefaults.removeObject(forKey: .distributorId)
        userdefaults.removeObject(forKey: .schoolName)
    }
    
    
}
