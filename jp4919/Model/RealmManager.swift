//
//  RealmManager.swift
//  jp4919
//
//  Created by shogo-ka on 2018/08/23.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import Firebase

class RealmManager {
    var ref:DatabaseReference?
    
    // ["id"]以下のSnapshot を 保存
    func idStore(snapshot:DataSnapshot){
        ref = snapshot.ref
        
    }
}
