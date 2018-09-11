//
//  CitiesSettingViewController.swift
//  jp4919
//
//  Created by shogo-ka on 2018/08/29.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import UIKit

class CitiesSettingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var prefectureName = ""
    var citiesList = [String]()
    var schoolsDictionary = [String:Array<String>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = citiesList[indexPath.row]
        return cell
    }
    
    // タップした時の遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cityName:String = citiesList[indexPath.row]
        let schoolsList:Array<String> = schoolsDictionary[cityName]!
        
        self.performSegue(withIdentifier: "toSchoolsSettingVC", sender: schoolsList)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSchoolsSettingVC" {
            let schoolSettingVC = segue.destination as! SchoolsSettingViewController
            schoolSettingVC.schoolsList = sender as! Array<String>
        }
    }

}
