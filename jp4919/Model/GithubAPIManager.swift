//
//  GithubManager.swift
//  jp4919
//
//  Created by shogo-ka on 2018/08/29.
//  Copyright © 2018年 shogo-ka. All rights reserved.
//

import SwiftyJSON
import Alamofire

class GithubAPIManager:NSObject  {
    static let shared = GithubAPIManager()
    
    /// GithubのAPIをたたいて，Contentを取得する
    ///
    /// - Parameters:
    ///   - handler: Contentの中身を返す
    func getContent(urlString:String, handler: @escaping (String?, Error?) -> ()){
        Alamofire.request(urlString).responseJSON {response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let content = json["content"].string!
                handler(content, nil)
                
            case .failure(let error):
                print(error)
                handler(nil, nil)
            }
        }
    }
    
    
}
