//
//  PrefecturesSettingViewController.swift
//  jp4919
//
//  Created by shogo-ka on 2018/07/29.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import UIKit
import MBProgressHUD

class PrefecturesSettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    let githubAPI = GithubAPIManager.shared
    
    var mbHUD = MBProgressHUD()
    
    var prefecturesList = [String]()
    var prefecturesDictonary = [String:Array<String>]()
    var schoolsDictonary = [String:Array<String>]()
    
    private let areaList = ["北海道地方", "東北地方", "関東地方", "中部地方", "近畿地方", "中国地方", "四国地方","九州・沖縄地方"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if prefecturesList.isEmpty {
            mbHUD = MBProgressHUD.showAdded(to: (self.navigationController?.view)!, animated: true)
            self.mbHUD.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.2)
            mbHUD.mode = MBProgressHUDMode.annularDeterminate
            mbHUD.label.text = "Loading..."
            self.reload()
        }
    }
    
    func reload(){
        
        prefecturesList.removeAll()
        prefecturesDictonary.removeAll()
        schoolsDictonary.removeAll()
        
        print("reloading")
        
        githubAPI.getContent(urlString: Config.urlStr.areas.rawValue, handler: { (content, error) in
            if content != nil{
                let data = Data(base64Encoded: content!, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
                let areaCsvStr = String(data:data!, encoding: .utf8)
                let replacedAreaCsvStr = areaCsvStr!.replacingOccurrences(of: "\r\n", with: "\n")
                var csvArray = replacedAreaCsvStr.components(separatedBy: "\n")
                csvArray.removeFirst()
                
                // 配列をパースして各リスト，辞書を作成
                for raw in csvArray{
                    let replacedRowArray = raw.components(separatedBy: ",")
                    let prefectureName: String = replacedRowArray[1]
                    let cityName: String = replacedRowArray[3]
                    
                    // 市町村名一覧のリスト
                    var cityNameList = [String]()
                    if self.prefecturesDictonary[prefectureName] != nil{
                        cityNameList = self.prefecturesDictonary[prefectureName]!
                    }
                    cityNameList.append(cityName)
            
                    // 県名リストに登録されていない場合はリストに登録
                    if self.prefecturesList.contains(prefectureName) == false{
                        self.prefecturesList.append(prefectureName)
                    }
                    // 県名をkey, 市町村名一覧のリストをvalueとした辞書を登録
                    self.prefecturesDictonary[prefectureName] = cityNameList
                    
                    // 市をkey, 小学校名の配列をvalueとした辞書を登録
                    let schoolList: [String] = replacedRowArray[4].components(separatedBy: " ")
                    self.schoolsDictonary[cityName] = schoolList

                }
                
                print("END 👿")
                
                print(self.prefecturesDictonary)
                print(self.prefecturesList)
                print(self.schoolsDictonary)
                
                self.mbHUD.hide(animated: false)
                
                self.tableView.reloadData()
                
            }
        })
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return areaList.count
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return areaList[section]
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.prefecturesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = prefecturesList[indexPath.row]
        return cell
    }
    
    // タップした時の遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let prefectureName = prefecturesList[indexPath.row]
        let citiesList = prefecturesDictonary[prefectureName]
        
        self.performSegue(withIdentifier: "toCitiesSettingVC", sender: citiesList)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCitiesSettingVC" {
            let citiesSettingVC = segue.destination as! CitiesSettingViewController
            citiesSettingVC.citiesList = sender as! Array<String>
            citiesSettingVC.schoolsDictionary = self.schoolsDictonary
        }
    }
}
