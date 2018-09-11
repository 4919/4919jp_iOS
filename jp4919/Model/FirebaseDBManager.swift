//
//  firebaseManager.swift
//  jp4919
//
//  Created by shogo-ka on 2018/08/22.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import Foundation
import Firebase

class FirebaseDBManager {
    private var ref: DatabaseReference
    
    init() {
        ref = Database.database().reference()
        
    }
    
    // ID一覧を取得
    func fetchIds(){
        self.ref.child("id").observeSingleEvent(of: .value) { (snapshot) in
            // IDのリストが取得できていたら
            if let idDict = snapshot.value as? [String:AnyObject]{
                for prefectureInfo in idDict{
                    // let prefectureID = prefectureInfo.key
                    if let prefectureDict = prefectureInfo.value as? [String:AnyObject]{
                        print(prefectureDict["prefecture"])
                        for cityInfo in prefectureDict{
                            if cityInfo.key == "city"{
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
}
