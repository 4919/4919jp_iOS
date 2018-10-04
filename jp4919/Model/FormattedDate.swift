//
//  Date.swift
//  jp4919
//
//  Created by shogo-ka on 2018/09/26.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import Foundation

class FormattedDate:NSObject {
    
    func getDisplayDate() -> String{
        let now = Date()
        let formatter = DateFormatter()
        let jaLocale = Locale(identifier: "ja_JP")
        formatter.locale = jaLocale
        formatter.dateFormat = "MM月dd日(E)"
        
        return formatter.string(from: now)
    }
    
    func getQueryDate() -> String{
        let now = Date()
        let formatter = DateFormatter()
        let jaLocale = Locale(identifier: "ja_JP")
        formatter.locale = jaLocale
        formatter.dateFormat = "YYYYMMdd"
        
        return formatter.string(from: now)
    }
}
