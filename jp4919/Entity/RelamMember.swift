//
//  RelamMember.swift
//  jp4919
//
//  Created by shogo-ka on 2018/08/23.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import Foundation
import Realm
import RealmSwift


//
// 表示する学校を選択するためのメソッド
//
// エリアID情報
class AreaIdentifier: Object{
    @objc dynamic var id = ""
    let prefectureList = List<Prefecture>()
}

// 都道府県
class Prefecture: Object{
    @objc dynamic var id = ""
    @objc dynamic var prefecture = ""
    let city = List<City>()
    let distrebutorList = List<Distributor>()
}

// 市町村
class City: Object{
    @objc dynamic var name = ""
    @objc dynamic var citycode = ""
    let primarySchoolList = List<String>()
}

// 配給元
class Distributor: Object{
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    let primarySchoolList = List<String>()
}


// 献立情報
class Menu: Object{
    
}

//
