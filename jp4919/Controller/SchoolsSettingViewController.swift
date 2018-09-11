//
//  SchoolsSettingViewController.swift
//  jp4919
//
//  Created by shogo-ka on 2018/08/29.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import UIKit
import MBProgressHUD

class SchoolsSettingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    let githubAPI = GithubAPIManager.shared
    var mbHUD = MBProgressHUD()
    
    var schoolsList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = schoolsList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        popAlert(schoolName: schoolsList[indexPath.row])
    }
    
    // DistributorId
    private func getDistributorId(schoolName:String, handler: @escaping (String?, Error?) -> ()){
        githubAPI.getContent(urlString: Config.urlStr.distribuors.rawValue) { (content, error) in
            if content != nil{
                let data = Data(base64Encoded: content!, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
                let distributorCsvStr = String(data:data!, encoding: .utf8)
                let replacedDistributorCsvStr = distributorCsvStr!.replacingOccurrences(of: "\r\n", with: "\n")
                var csvArray = replacedDistributorCsvStr.components(separatedBy: "\n")
                csvArray.removeFirst()
                
                for row in csvArray{
                    if row.contains(schoolName){
                        let replacedRowArray = row.components(separatedBy: ",")
                        let distributorId: String = replacedRowArray[0]
                        handler(distributorId, nil)
                    }
                }
                
            }
        }
    }
    
    // 登録情報を確認
    private func popAlert(schoolName:String){
        let message = schoolName + "で登録しますか？"
        let alert:UIAlertController = UIAlertController(title: "確認", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // OK
        let defaultAction: UIAlertAction = UIAlertAction(title: "登録", style: .default) { (action: UIAlertAction!) -> Void in
            self.mbHUD = MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
            self.mbHUD.mode = MBProgressHUDMode.annularDeterminate
            self.mbHUD.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.2)
            self.mbHUD.label.text = "Loading..."
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainVC = storyboard.instantiateViewController(withIdentifier: "MenuNaviVC")
            
            self.getDistributorId(schoolName: schoolName, handler: { (distributorId, error) in
                //UserDefaultsにIDを登録して画面を遷移する。
                UserDefaults.standard.set(distributorId!, forKey: .distributorId)
                UserDefaults.standard.set(schoolName, forKey: .schoolName)
                print(UserDefaults.standard.string(forKey: .distributorId)!)
                self.mbHUD.hide(animated: true)
                self.present(mainVC, animated: false)
            })
        }
        
        //cancel
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: .cancel) { (action: UIAlertAction!) -> Void in
            print("cancel")
        }
        
        alert.addAction(cancelAction)
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}
