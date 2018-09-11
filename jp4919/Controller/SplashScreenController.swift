//
//  ViewController.swift
//  jp4919
//
//  Created by shogo-ka on 2018/05/30.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var splashImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userdefaults = UserDefaults.standard
        
        UIView.animate(withDuration: 0.3, delay: 1.0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }) { (Bool) in
        }
        
        UIView.animate(withDuration: 0.2, delay: 1.3, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.splashImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
            self.splashImageView.alpha = 0
        }) { (Bool) in
            self.splashImageView.removeFromSuperview()
            
            // ２回目以降起動時
            if userdefaults.string(forKey: .distributorId) != nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let mainVC = storyboard.instantiateViewController(withIdentifier: "MenuNaviVC")
                self.present(mainVC, animated: true, completion: nil)
                // 初回起動時
            }else{
                let storyboard = UIStoryboard(name: "Tutorial", bundle: nil)
                let tutorialVC = storyboard.instantiateInitialViewController() as! TutorialViewController
                self.present(tutorialVC, animated: true, completion: nil)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
