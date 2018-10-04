//
//  TodayMenuViewController.swift
//  jp4919
//
//  Created by shogo-ka on 2018/07/28.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import UIKit
import MBProgressHUD

// TODO
// [◯] イラストの対応づけ
// [◯] 栄養素の表示
// [] メニューの詳細への遷移
// [] 栄養素の詳細表示への遷移
// [] Realmへの登録と呼び出し
// [] 別の日の表示

class TodayMenuViewController: UIViewController {
    @IBOutlet weak var naviTitle: UINavigationItem!
    @IBOutlet weak var dateLabel: UILabel!
    
    // Instance
    let userdefaults = UserDefaults.standard
    let formattedDate = FormattedDate()
    let githubAPI = GithubAPIManager.shared
    let mbHUD = MBProgressHUD()
    
    // Member
    var distributorId = ""
    
    // menuBtn
    @IBOutlet weak var menuBtn1: UIButton!
    @IBOutlet weak var menuBtn2: UIButton!
    @IBOutlet weak var menuBtn3: UIButton!
    @IBOutlet weak var menuBtn4: UIButton!
    @IBOutlet weak var menuBtn5: UIButton!
    @IBOutlet weak var menuBtn6: UIButton!
    @IBOutlet weak var menuBtn7: UIButton!
    
    // 栄養素ラベル
    @IBOutlet weak var energyLabel: UILabel!
    @IBOutlet weak var fatLebel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var saltLabel: UILabel!
    
    @IBOutlet weak var energyVal: UILabel!
    @IBOutlet weak var fatVal: UILabel!
    @IBOutlet weak var proteinVal: UILabel!
    @IBOutlet weak var saltVal: UILabel!
    
    
    // illustBtn
    @IBOutlet weak var illustBtn1: UIButton!
    @IBOutlet weak var illustBtn2: UIButton!
    @IBOutlet weak var illustBtn3: UIButton!
    @IBOutlet weak var illustBtn4: UIButton!
    @IBOutlet weak var illustBtn5: UIButton!
    @IBOutlet weak var illustBtn6: UIButton!
    @IBOutlet weak var illustBtn7: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        naviTitle.title = userdefaults.string(forKey: .schoolName)!
        dateLabel.text =  formattedDate.getDisplayDate()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        let queryDate = formattedDate.getQueryDate()
        let jsonFileName = userdefaults.string(forKey: .distributorId)! + ".json"
        let urlString = Config.urlStr.menusPath.rawValue + jsonFileName
        let illustration = Illustration()
        
        githubAPI.getTodayMenu(urlString: urlString, date: queryDate) { (todayMenuJson, error) in
            // メニューの表示
            for menu in todayMenuJson!["menu"]{
                var menuName:String = ""
                var illust:UIImage = UIImage()
                
                if menu.0 == "0"{
                    menuName = menu.1["name"].string!
                    illust = illustration.getIllustImage(menuName: menuName)
                    self.menuBtn1.setTitle(menuName, for: .normal)
                    self.illustBtn1.setImage(illust, for: .normal)
                }else if menu.0 == "1"{
                    menuName = menu.1["name"].string!
                    illust = illustration.getIllustImage(menuName: menuName)
                    self.menuBtn2.setTitle(menuName, for: .normal)
                    self.illustBtn2.setImage(illust, for: .normal)
                }else if menu.0 == "2"{
                    menuName = menu.1["name"].string!
                    illust = illustration.getIllustImage(menuName: menuName)
                    self.menuBtn3.setTitle(menuName, for: .normal)
                    self.illustBtn3.setImage(illust, for: .normal)
                }else if menu.0 == "3"{
                    menuName = menu.1["name"].string!
                    illust = illustration.getIllustImage(menuName: menuName)
                    self.menuBtn4.setTitle(menuName, for: .normal)
                    self.illustBtn4.setImage(illust, for: .normal)
                }else if menu.0 == "4"{
                    menuName = menu.1["name"].string!
                    illust = illustration.getIllustImage(menuName: menuName)
                    self.menuBtn5.setTitle(menuName, for: .normal)
                    self.illustBtn5.setImage(illust, for: .normal)
                }else if menu.0 == "5"{
                    menuName = menu.1["name"].string!
                    illust = illustration.getIllustImage(menuName: menuName)
                    self.menuBtn6.setTitle(menuName, for: .normal)
                    self.illustBtn6.setImage(illust, for: .normal)
                }else if menu.0 == "6"{
                    menuName = menu.1["name"].string!
                    illust = illustration.getIllustImage(menuName: menuName)
                    self.menuBtn7.setTitle(menuName, for: .normal)
                    self.illustBtn7.setImage(illust, for: .normal)
                }
            }
            // 栄養素の表示
            for nutrition in todayMenuJson!["nutritions"]{
                print(nutrition)
                if nutrition.0 == "energy"{
                    self.energyLabel.isHidden = false
                    self.energyVal.text = String(nutrition.1.int!) + (" kcal")
                }else if nutrition.0 == "fat"{
                    self.fatLebel.isHidden = false
                    self.fatVal.text = String(nutrition.1.float!) + (" g")
                }else if nutrition.0 == "protein"{
                    self.proteinLabel.isHidden = false
                    self.proteinVal.text = String(nutrition.1.int!) + (" g")
                }else if nutrition.0 == "salt_equivalent"{
                    self.saltLabel.isHidden = false
                    self.saltVal.text = String(nutrition.1.float!) + (" g")
                }
            }
        }
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
